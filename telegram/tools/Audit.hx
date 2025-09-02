package telegram.tools;

import haxe.ds.StringMap;
import haxe.Timer;
import haxe.Json;
import telegram.data.messages.Message;
import telegram.data.updates.Update;
import telegram.data.updates.CallbackQuery;

/**
 * Audit collects lightweight runtime metrics for a Telegram bot.
 * It does not depend on internal TelegramBot details.
 * Feed it Updates or Messages. Pull a snapshot when needed.
 *
 * Usage:
 *   final audit = new Audit();
 *   // in your update loop:
 *   audit.onUpdate(u);
 *   // on send:
 *   audit.onSent(kind, bytes);
 *   // export:
 *   trace(audit.toJSON());
 */
class Audit {
    public var startedAt:Float;
    public var lastUpdateAt:Null<Float> = null;
    public var lastErrorAt:Null<Float> = null;

    // Counters
    public var totalUpdates:Int = 0;
    public var totalMessages:Int = 0;
    public var totalCallbacks:Int = 0;
    public var totalErrors:Int = 0;

    public var sentCount:Int = 0;
    public var sentBytes:Float = 0;

    final byChat:Map<Int, Counters> = new Map();
    final byUser:Map<Int, Counters> = new Map();
    final errors:Array<{t:Float, msg:String}> = [];

    // Config
    public var maxErrorHistory:Int = 20;

    public function new() {
        startedAt = Timer.stamp();
    }

    public function onUpdate(u:Update):Void {
        totalUpdates++;
        lastUpdateAt = Timer.stamp();
        if (u.message != null) onMessage(u.message);
        if (u.callback_query != null) onCallback(u.callback_query);
    }

    public function onMessage(m:Message):Void {
        totalMessages++;
        bumpChat(m.chat.id, "messages");
        if (m.from != null) bumpUser(m.from.id, "messages");
    }

    public function onCallback(c:CallbackQuery):Void {
        totalCallbacks++;
        bumpUser(c.from.id, "callbacks");
        if (c.message != null) bumpChat(c.message.chat.id, "callbacks");
    }

    public function onError(e:Dynamic):Void {
        totalErrors++;
        lastErrorAt = Timer.stamp();
        var msg = Std.string(e);
        errors.push({t: lastErrorAt, msg: msg});
        if (errors.length > maxErrorHistory) errors.shift();
    }

    /**
     * Call when the bot sends something to Telegram.
     * @param kind e.g. "text", "photo", "document"
     * @param bytes payload size if known (optional, set -1 if unknown)
     */
    public function onSent(kind:String, ?bytes:Float):Void {
        sentCount++;
        if (bytes != null && bytes > 0) sentBytes += bytes;
    }

    public function clear():Void {
        totalUpdates = totalMessages = totalCallbacks = totalErrors = sentCount = 0;
        sentBytes = 0;
        byChat.clear();
        byUser.clear();
        errors.resize(0);
        startedAt = Timer.stamp();
        lastUpdateAt = lastErrorAt = null;
    }

    public function snapshot():AuditReport {
        return {
            uptime_sec: Timer.stamp() - startedAt,
            last_update_at: lastUpdateAt,
            last_error_at: lastErrorAt,
            totals: {
                updates: totalUpdates,
                messages: totalMessages,
                callbacks: totalCallbacks,
                sent: sentCount,
                sent_bytes: sentBytes,
                errors: totalErrors
            },
            top_chats: topN(byChat, 10),
            top_users: topN(byUser, 10),
            recent_errors: [for (e in errors) { t: e.t, msg: e.msg }]
        };
    }

    public function toJSON(pretty:Bool = false):String {
        final s = snapshot();
        return pretty ? Json.stringify(s, null, "  ") : Json.stringify(s);
    }

    // Helpers
    inline function bumpChat(chatId:Int, field:String):Void {
        var c = byChat.get(chatId);
        if (c == null) {
            c = { messages: 0, callbacks: 0 };
            byChat.set(chatId, c);
        }
        Reflect.setField(c, field, Reflect.field(c, field) + 1);
    }

    inline function bumpUser(userId:Int, field:String):Void {
        var c = byUser.get(userId);
        if (c == null) {
            c = { messages: 0, callbacks: 0 };
            byUser.set(userId, c);
        }
        Reflect.setField(c, field, Reflect.field(c, field) + 1);
    }

    static function topN(src:Map<Int, Counters>, n:Int):Array<{id:Int, messages:Int, callbacks:Int, score:Int}> {
        final arr = new Array<{id:Int, messages:Int, callbacks:Int, score:Int}>();
        for (id in src.keys()) {
            final c = src.get(id);
            final score = c.messages + c.callbacks * 2;
            arr.push({ id: id, messages: c.messages, callbacks: c.callbacks, score: score });
        }
        arr.sort(function(a,b) return b.score - a.score);
        if (arr.length > n) arr.resize(n);
        return arr;
    }
}

typedef Counters = {
    var messages:Int;
    var callbacks:Int;
}

typedef AuditReport = {
    var uptime_sec:Float;
    var last_update_at:Null<Float>;
    var last_error_at:Null<Float>;
    var totals:{
        var updates:Int;
        var messages:Int;
        var callbacks:Int;
        var sent:Int;
        var sent_bytes:Float;
        var errors:Int;
    };
    var top_chats:Array<{id:Int, messages:Int, callbacks:Int, score:Int}>;
    var top_users:Array<{id:Int, messages:Int, callbacks:Int, score:Int}>;
    var recent_errors:Array<{t:Float, msg:String}>;
}
