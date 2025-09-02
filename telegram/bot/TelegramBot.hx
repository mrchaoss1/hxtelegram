package telegram.bot;

import haxe.Http;
import haxe.Json;
import haxe.Timer;

import telegram.events.EventEmitter;

import telegram.errors.TelegramError;
import telegram.errors.TelegramError.TelegramResult;

import telegram.data.base.Response.TelegramResponse;
import telegram.data.messages.Message;
import telegram.data.updates.Update;
import telegram.data.updates.CallbackQuery;
import telegram.data.files.File;
import telegram.data.keyboard.InlineKeyboard;

using StringTools;

typedef BotConfig = {
    ?baseUrl:String,   // API host override
    ?pollTimeout:Int   // seconds
}

class TelegramBot {
    public final onMessage = new EventEmitter<Message>();
    public final onCallbackQuery = new EventEmitter<CallbackQuery>();

    final token:String;
    final baseUrl:String;
    var offset:Int = 0;
    var pollTimer:Timer;

    public function new(token:String, ?config:BotConfig) {
        this.token = token;
        this.baseUrl = (config != null && config.baseUrl != null) ? config.baseUrl : "https://api.telegram.org";
    }

    public function startPolling(?timeoutSec:Int):Void {
        final t = timeoutSec != null ? timeoutSec : 20;
        if (pollTimer != null) pollTimer.stop();
        pollTimer = new Timer(0);
        pollCycle(t);
    }

    public function stopPolling():Void {
        if (pollTimer != null) pollTimer.stop();
    }

    // --- API

    public function sendMessage(
        chatId:Int,
        text:String,
        ?params:{ ?parse_mode:String, ?reply_markup:InlineKeyboardMarkup },
        cb:TelegramResult<Message>->Void
    ):Void {
        final p:Dynamic = {};
        Reflect.setField(p, "chat_id", chatId);
        Reflect.setField(p, "text", text);
        if (params != null) {
            if (params.parse_mode != null) Reflect.setField(p, "parse_mode", params.parse_mode);
            if (params.reply_markup != null) Reflect.setField(p, "reply_markup", params.reply_markup); // raw object, no stringify
        }
        request("sendMessage", p, cb);
    }

    public function sendPhoto(chatId:Int, photoUrl:String, ?caption:String, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, photo: photoUrl };
        if (caption != null) Reflect.setField(p, "caption", caption);
        request("sendPhoto", p, cb);
    }

    public function getFile(fileId:String, cb:TelegramResult<File>->Void):Void {
        final p:Dynamic = { file_id: fileId };
        request("getFile", p, cb);
    }

    public function answerCallbackQuery(id:String, ?text:String, ?showAlert:Bool, ?url:String, ?cacheTime:Int, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { callback_query_id: id };
        if (text != null) Reflect.setField(p, "text", text);
        if (showAlert != null) Reflect.setField(p, "show_alert", showAlert);
        if (url != null) Reflect.setField(p, "url", url);
        if (cacheTime != null) Reflect.setField(p, "cache_time", cacheTime);
        request("answerCallbackQuery", p, cb);
    }

    // --- internals

    function pollCycle(timeoutSec:Int):Void {
        trace('poll getUpdates offset=' + offset);
        final p:Dynamic = { timeout: timeoutSec };
        if (offset > 0) Reflect.setField(p, "offset", offset);
        request("getUpdates", p, (res:TelegramResult<Array<Update>>) -> {
            if (!res.success) {
                Timer.delay(() -> pollCycle(timeoutSec), 2000);
                return;
            }
            final updates = res.data != null ? res.data : [];
            for (u in updates) {
                if (u.update_id >= offset) offset = u.update_id + 1;
                if (u.message != null) onMessage.emit(u.message);
                if (u.callback_query != null) onCallbackQuery.emit(u.callback_query);
            }
            pollCycle(timeoutSec);
        });
    }

    function request<T>(method:String, params:Dynamic, cb:TelegramResult<T>->Void):Void {
        final url = baseUrl + "/bot" + token + "/" + method;
        final body = buildQuery(params);

        final http = new Http(url);
        http.onStatus = code -> trace('HTTP ' + method + ' -> ' + code);
        http.onData = data -> {
            try {
                final parsed:TelegramResponse<T> = Json.parse(data);
                if (parsed.ok) {
                    cb({ success:true, data: parsed.result });
                } else {
                    cb({
                        success:false,
                        error: TelegramError.APIError(
                            parsed.error_code != null ? parsed.error_code : -1,
                            parsed.description != null ? parsed.description : "API error"
                        )
                    });
                }
            } catch (e:Dynamic) {
                cb({ success:false, error: TelegramError.ParseError(Std.string(e)) });
            }
        }
        http.onError = err -> {
            trace('HTTP error ' + method + ': ' + err);
            cb({ success:false, error: TelegramError.NetworkError(err) });
        }
        
        @:privateAccess {
            http.setHeader("Content-Type", "application/x-www-form-urlencoded");
            http.postData = body;
        }
        http.request(true); // POST
    }

    static function buildQuery(params:Dynamic):String {
        if (params == null) return "";
        final parts = new Array<String>();
        for (name in Reflect.fields(params)) {
            final v:Dynamic = Reflect.field(params, name);
            if (v == null) continue;
            final s = Std.isOfType(v, String) ? (v : String) : Json.stringify(v);
            parts.push(StringTools.urlEncode(name) + "=" + StringTools.urlEncode(s));
        }
        return parts.join("&");
    }

    static inline function encodeURIComponent(s:String):String return StringTools.urlEncode(s);
}