package telegram.bot;

import haxe.Http;
import haxe.Json;
import haxe.Timer;

import telegram.events.EventEmitter;

import telegram.errors.TelegramError;
import telegram.errors.TelegramError.TelegramResult;

import telegram.base.TelegramResponse;
import telegram.types.ChatId;
import telegram.types.Message;
import telegram.types.MessageId;
import telegram.types.Update;
import telegram.types.CallbackQuery;
import telegram.types.InlineQuery;
import telegram.types.ChosenInlineResult;
import telegram.types.ShippingQuery;
import telegram.types.PreCheckoutQuery;
import telegram.types.PaidMediaPurchased;
import telegram.types.Poll;
import telegram.types.PollAnswer;
import telegram.types.ChatMemberUpdated;
import telegram.types.ChatMember;
import telegram.types.ChatJoinRequest;
import telegram.types.ChatBoostUpdated;
import telegram.types.ChatBoostRemoved;
import telegram.types.MessageReactionUpdated;
import telegram.types.MessageReactionCountUpdated;
import telegram.types.BusinessConnection;
import telegram.types.BusinessMessagesDeleted;
import telegram.types.File;
import telegram.types.User;
import telegram.types.BotCommand;
import telegram.types.ChatFullInfo;
import telegram.types.UserProfilePhotos;
import telegram.types.WebhookInfo;

using StringTools;

typedef BotConfig = {
    ?baseUrl:String,
    ?pollTimeout:Int,
    ?debug:Bool,
    ?allowedUpdates:Array<String>
}

typedef SendOptions = {
    ?parse_mode:String,
    ?reply_markup:Dynamic,
    ?reply_parameters:Dynamic,
    ?message_thread_id:Int,
    ?disable_notification:Bool,
    ?protect_content:Bool,
    ?caption:String,
    ?caption_entities:Array<Dynamic>,
    ?show_caption_above_media:Bool,
    ?entities:Array<Dynamic>,
    ?link_preview_options:Dynamic,
    ?has_spoiler:Bool,
    ?business_connection_id:String,
    ?message_effect_id:String
}

class TelegramBot {
    public final onUpdate = new EventEmitter<Update>();

    public final onMessage = new EventEmitter<Message>();
    public final onEditedMessage = new EventEmitter<Message>();
    public final onChannelPost = new EventEmitter<Message>();
    public final onEditedChannelPost = new EventEmitter<Message>();
    public final onBusinessConnection = new EventEmitter<BusinessConnection>();
    public final onBusinessMessage = new EventEmitter<Message>();
    public final onEditedBusinessMessage = new EventEmitter<Message>();
    public final onDeletedBusinessMessages = new EventEmitter<BusinessMessagesDeleted>();
    public final onMessageReaction = new EventEmitter<MessageReactionUpdated>();
    public final onMessageReactionCount = new EventEmitter<MessageReactionCountUpdated>();
    public final onInlineQuery = new EventEmitter<InlineQuery>();
    public final onChosenInlineResult = new EventEmitter<ChosenInlineResult>();
    public final onCallbackQuery = new EventEmitter<CallbackQuery>();
    public final onShippingQuery = new EventEmitter<ShippingQuery>();
    public final onPreCheckoutQuery = new EventEmitter<PreCheckoutQuery>();
    public final onPurchasedPaidMedia = new EventEmitter<PaidMediaPurchased>();
    public final onPoll = new EventEmitter<Poll>();
    public final onPollAnswer = new EventEmitter<PollAnswer>();
    public final onMyChatMember = new EventEmitter<ChatMemberUpdated>();
    public final onChatMember = new EventEmitter<ChatMemberUpdated>();
    public final onChatJoinRequest = new EventEmitter<ChatJoinRequest>();
    public final onChatBoost = new EventEmitter<ChatBoostUpdated>();
    public final onRemovedChatBoost = new EventEmitter<ChatBoostRemoved>();

    public final onError = new EventEmitter<TelegramError>();

    final token:String;
    final baseUrl:String;
    final debug:Bool;
    final allowedUpdates:Array<String>;

    var offset:Int = 0;
    var polling:Bool = false;
    var pollBackoff:Int = 0;

    static inline var MAX_BACKOFF_MS = 30000;

    public function new(token:String, ?config:BotConfig) {
        this.token = token;
        this.baseUrl = (config != null && config.baseUrl != null) ? config.baseUrl : "https://api.telegram.org";
        this.debug = config != null && config.debug == true;
        this.allowedUpdates = config != null ? config.allowedUpdates : null;
    }

    public function startPolling(?timeoutSec:Int):Void {
        final t = timeoutSec != null ? timeoutSec : 20;
        if (polling) return;
        polling = true;
        pollBackoff = 0;
        #if sys
        while (polling) pollOnce(t);
        #else
        pollOnce(t);
        #end
    }

    public function stopPolling():Void {
        polling = false;
    }

    public inline function isPolling():Bool return polling;

    public function api<T>(method:String, ?params:{}, cb:TelegramResult<T>->Void):Void {
        request(method, params != null ? params : {}, cb);
    }

    public function getMe(cb:TelegramResult<User>->Void):Void
        request("getMe", {}, cb);

    public function logOut(cb:TelegramResult<Bool>->Void):Void
        request("logOut", {}, cb);

    public function close(cb:TelegramResult<Bool>->Void):Void
        request("close", {}, cb);

    public function getChat(chatId:ChatId, cb:TelegramResult<ChatFullInfo>->Void):Void
        request("getChat", { chat_id: chatId }, cb);

    public function getChatMemberCount(chatId:ChatId, cb:TelegramResult<Int>->Void):Void
        request("getChatMemberCount", { chat_id: chatId }, cb);

    public function getChatMember(chatId:ChatId, userId:Int, cb:TelegramResult<ChatMember>->Void):Void
        request("getChatMember", { chat_id: chatId, user_id: userId }, cb);

    public function getUserProfilePhotos(userId:Int, ?options:{}, cb:TelegramResult<UserProfilePhotos>->Void):Void {
        final p:Dynamic = { user_id: userId };
        setFields(p, options);
        request("getUserProfilePhotos", p, cb);
    }

    public function getFile(fileId:String, cb:TelegramResult<File>->Void):Void
        request("getFile", { file_id: fileId }, cb);

    public inline function fileLink(filePath:String):String
        return baseUrl + "/file/bot" + token + "/" + filePath;

    public function sendMessage(chatId:ChatId, text:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, text: text };
        setFields(p, options);
        request("sendMessage", p, cb);
    }

    public function sendPhoto(chatId:ChatId, photo:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, photo: photo };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendPhoto", p, cb);
    }

    public function sendDocument(chatId:ChatId, document:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, document: document };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendDocument", p, cb);
    }

    public function sendAudio(chatId:ChatId, audio:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, audio: audio };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendAudio", p, cb);
    }

    public function sendVideo(chatId:ChatId, video:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, video: video };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendVideo", p, cb);
    }

    public function sendAnimation(chatId:ChatId, animation:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, animation: animation };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendAnimation", p, cb);
    }

    public function sendVoice(chatId:ChatId, voice:String, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, voice: voice };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("sendVoice", p, cb);
    }

    public function sendSticker(chatId:ChatId, sticker:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, sticker: sticker };
        setFields(p, options);
        request("sendSticker", p, cb);
    }

    public function sendLocation(chatId:ChatId, latitude:Float, longitude:Float, ?options:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, latitude: latitude, longitude: longitude };
        setFields(p, options);
        request("sendLocation", p, cb);
    }

    public function sendContact(chatId:ChatId, phoneNumber:String, firstName:String, ?options:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, phone_number: phoneNumber, first_name: firstName };
        setFields(p, options);
        request("sendContact", p, cb);
    }

    public function sendDice(chatId:ChatId, ?emoji:String, ?options:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId };
        if (emoji != null) Reflect.setField(p, "emoji", emoji);
        setFields(p, options);
        request("sendDice", p, cb);
    }

    public function sendPoll(chatId:ChatId, question:String, options:Array<Dynamic>, ?extra:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, question: question, options: options };
        setFields(p, extra);
        request("sendPoll", p, cb);
    }

    public function sendChatAction(chatId:ChatId, action:String, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, action: action };
        setFields(p, options);
        request("sendChatAction", p, cb);
    }

    public function sendMediaGroup(chatId:ChatId, media:Array<Dynamic>, ?options:{}, cb:TelegramResult<Array<Message>>->Void):Void {
        final p:Dynamic = { chat_id: chatId, media: media };
        setFields(p, options);
        request("sendMediaGroup", p, cb);
    }

    public function forwardMessage(chatId:ChatId, fromChatId:ChatId, messageId:Int, ?options:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, from_chat_id: fromChatId, message_id: messageId };
        setFields(p, options);
        request("forwardMessage", p, cb);
    }

    public function copyMessage(chatId:ChatId, fromChatId:ChatId, messageId:Int, ?options:{}, cb:TelegramResult<MessageId>->Void):Void {
        final p:Dynamic = { chat_id: chatId, from_chat_id: fromChatId, message_id: messageId };
        setFields(p, options);
        request("copyMessage", p, cb);
    }

    public function editMessageText(chatId:ChatId, messageId:Int, text:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, message_id: messageId, text: text };
        setFields(p, options);
        request("editMessageText", p, cb);
    }

    public function editMessageCaption(chatId:ChatId, messageId:Int, ?caption:String, ?options:SendOptions, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, message_id: messageId };
        if (caption != null) Reflect.setField(p, "caption", caption);
        setFields(p, options);
        request("editMessageCaption", p, cb);
    }

    public function editMessageReplyMarkup(chatId:ChatId, messageId:Int, ?replyMarkup:{}, cb:TelegramResult<Message>->Void):Void {
        final p:Dynamic = { chat_id: chatId, message_id: messageId };
        if (replyMarkup != null) Reflect.setField(p, "reply_markup", replyMarkup);
        request("editMessageReplyMarkup", p, cb);
    }

    public function deleteMessage(chatId:ChatId, messageId:Int, cb:TelegramResult<Bool>->Void):Void
        request("deleteMessage", { chat_id: chatId, message_id: messageId }, cb);

    public function deleteMessages(chatId:ChatId, messageIds:Array<Int>, cb:TelegramResult<Bool>->Void):Void
        request("deleteMessages", { chat_id: chatId, message_ids: messageIds }, cb);

    public function setMessageReaction(chatId:ChatId, messageId:Int, ?reaction:Array<Dynamic>, ?isBig:Bool, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, message_id: messageId };
        if (reaction != null) Reflect.setField(p, "reaction", reaction);
        if (isBig != null) Reflect.setField(p, "is_big", isBig);
        request("setMessageReaction", p, cb);
    }

    public function pinChatMessage(chatId:ChatId, messageId:Int, ?disableNotification:Bool, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, message_id: messageId };
        if (disableNotification != null) Reflect.setField(p, "disable_notification", disableNotification);
        request("pinChatMessage", p, cb);
    }

    public function unpinChatMessage(chatId:ChatId, ?messageId:Int, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId };
        if (messageId != null) Reflect.setField(p, "message_id", messageId);
        request("unpinChatMessage", p, cb);
    }

    public function unpinAllChatMessages(chatId:ChatId, cb:TelegramResult<Bool>->Void):Void
        request("unpinAllChatMessages", { chat_id: chatId }, cb);

    public function banChatMember(chatId:ChatId, userId:Int, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, user_id: userId };
        setFields(p, options);
        request("banChatMember", p, cb);
    }

    public function unbanChatMember(chatId:ChatId, userId:Int, ?onlyIfBanned:Bool, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, user_id: userId };
        if (onlyIfBanned != null) Reflect.setField(p, "only_if_banned", onlyIfBanned);
        request("unbanChatMember", p, cb);
    }

    public function restrictChatMember(chatId:ChatId, userId:Int, permissions:Dynamic, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { chat_id: chatId, user_id: userId, permissions: permissions };
        setFields(p, options);
        request("restrictChatMember", p, cb);
    }

    public function leaveChat(chatId:ChatId, cb:TelegramResult<Bool>->Void):Void
        request("leaveChat", { chat_id: chatId }, cb);

    public function answerCallbackQuery(id:String, ?text:String, ?showAlert:Bool, ?url:String, ?cacheTime:Int, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { callback_query_id: id };
        if (text != null) Reflect.setField(p, "text", text);
        if (showAlert != null) Reflect.setField(p, "show_alert", showAlert);
        if (url != null) Reflect.setField(p, "url", url);
        if (cacheTime != null) Reflect.setField(p, "cache_time", cacheTime);
        request("answerCallbackQuery", p, cb);
    }

    public function answerInlineQuery(inlineQueryId:String, results:Array<Dynamic>, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { inline_query_id: inlineQueryId, results: results };
        setFields(p, options);
        request("answerInlineQuery", p, cb);
    }

    public function setMyCommands(commands:Array<BotCommand>, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { commands: commands };
        setFields(p, options);
        request("setMyCommands", p, cb);
    }

    public function getMyCommands(?options:{}, cb:TelegramResult<Array<BotCommand>>->Void):Void {
        final p:Dynamic = {};
        setFields(p, options);
        request("getMyCommands", p, cb);
    }

    public function deleteMyCommands(?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = {};
        setFields(p, options);
        request("deleteMyCommands", p, cb);
    }

    public function setWebhook(url:String, ?options:{}, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = { url: url };
        setFields(p, options);
        request("setWebhook", p, cb);
    }

    public function deleteWebhook(?dropPendingUpdates:Bool, cb:TelegramResult<Bool>->Void):Void {
        final p:Dynamic = {};
        if (dropPendingUpdates != null) Reflect.setField(p, "drop_pending_updates", dropPendingUpdates);
        request("deleteWebhook", p, cb);
    }

    public function getWebhookInfo(cb:TelegramResult<WebhookInfo>->Void):Void
        request("getWebhookInfo", {}, cb);

    function pollOnce(timeoutSec:Int):Void {
        if (!polling) return;
        if (debug) trace('poll getUpdates offset=' + offset);
        final p:Dynamic = { timeout: timeoutSec };
        if (offset > 0) Reflect.setField(p, "offset", offset);
        if (allowedUpdates != null) Reflect.setField(p, "allowed_updates", allowedUpdates);
        request("getUpdates", p, (res:TelegramResult<Array<Update>>) -> {
            if (!polling) return;
            if (!res.success) {
                pollBackoff++;
                final delay = Std.int(Math.min(MAX_BACKOFF_MS, 1000 * Math.pow(2, pollBackoff - 1)));
                if (debug) trace('poll failed, retrying in ' + delay + 'ms');
                #if sys
                Sys.sleep(delay / 1000);
                #else
                Timer.delay(() -> pollOnce(timeoutSec), delay);
                #end
                return;
            }
            pollBackoff = 0;
            final updates = res.data != null ? res.data : [];
            for (u in updates) {
                if (u.update_id >= offset) offset = u.update_id + 1;
                dispatch(u);
            }
            #if !sys
            pollOnce(timeoutSec);
            #end
        });
    }

    function dispatch(u:Update):Void {
        onUpdate.emit(u);
        if (u.message != null) onMessage.emit(u.message);
        if (u.edited_message != null) onEditedMessage.emit(u.edited_message);
        if (u.channel_post != null) onChannelPost.emit(u.channel_post);
        if (u.edited_channel_post != null) onEditedChannelPost.emit(u.edited_channel_post);
        if (u.business_connection != null) onBusinessConnection.emit(u.business_connection);
        if (u.business_message != null) onBusinessMessage.emit(u.business_message);
        if (u.edited_business_message != null) onEditedBusinessMessage.emit(u.edited_business_message);
        if (u.deleted_business_messages != null) onDeletedBusinessMessages.emit(u.deleted_business_messages);
        if (u.message_reaction != null) onMessageReaction.emit(u.message_reaction);
        if (u.message_reaction_count != null) onMessageReactionCount.emit(u.message_reaction_count);
        if (u.inline_query != null) onInlineQuery.emit(u.inline_query);
        if (u.chosen_inline_result != null) onChosenInlineResult.emit(u.chosen_inline_result);
        if (u.callback_query != null) onCallbackQuery.emit(u.callback_query);
        if (u.shipping_query != null) onShippingQuery.emit(u.shipping_query);
        if (u.pre_checkout_query != null) onPreCheckoutQuery.emit(u.pre_checkout_query);
        if (u.purchased_paid_media != null) onPurchasedPaidMedia.emit(u.purchased_paid_media);
        if (u.poll != null) onPoll.emit(u.poll);
        if (u.poll_answer != null) onPollAnswer.emit(u.poll_answer);
        if (u.my_chat_member != null) onMyChatMember.emit(u.my_chat_member);
        if (u.chat_member != null) onChatMember.emit(u.chat_member);
        if (u.chat_join_request != null) onChatJoinRequest.emit(u.chat_join_request);
        if (u.chat_boost != null) onChatBoost.emit(u.chat_boost);
        if (u.removed_chat_boost != null) onRemovedChatBoost.emit(u.removed_chat_boost);
    }

    function request<T>(method:String, params:Dynamic, cb:TelegramResult<T>->Void):Void {
        final url = baseUrl + "/bot" + token + "/" + method;
        final body = buildQuery(params);

        final http = new Http(url);
        if (debug) http.onStatus = code -> trace('HTTP ' + method + ' -> ' + code);
        http.onData = data -> {
            try {
                final parsed:TelegramResponse<T> = Json.parse(data);
                if (parsed.ok) {
                    cb({ success:true, data: parsed.result });
                } else {
                    final err = TelegramError.APIError(
                        parsed.error_code != null ? parsed.error_code : -1,
                        parsed.description != null ? parsed.description : "API error"
                    );
                    onError.emit(err);
                    cb({ success:false, error: err });
                }
            } catch (e:Dynamic) {
                final err = TelegramError.ParseError(Std.string(e));
                onError.emit(err);
                cb({ success:false, error: err });
            }
        }
        http.onError = msg -> {
            if (debug) trace('HTTP error ' + method + ': ' + msg);
            final err = TelegramError.NetworkError(msg);
            onError.emit(err);
            cb({ success:false, error: err });
        }

        @:privateAccess {
            http.setHeader("Content-Type", "application/x-www-form-urlencoded");
            http.postData = body;
        }
        http.request(true);
    }

    static function setFields(target:Dynamic, source:Dynamic):Void {
        if (source == null) return;
        for (name in Reflect.fields(source)) {
            final v:Dynamic = Reflect.field(source, name);
            if (v != null) Reflect.setField(target, name, v);
        }
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
}
