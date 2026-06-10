# hxtelegram

Typed Telegram Bot API client for Haxe. Ships simple long-polling, typed models, and event helpers.

[![haxelib](https://img.shields.io/badge/hxtelegram-v0.1.2-blue)](https://lib.haxe.org/p/hx_telegram)

## Features

* Haxe 4.3+ types for common Telegram objects (Message, User, Chat, Update, CallbackQuery, File, InlineKeyboard…)
* Minimal API surface with explicit callbacks via `TelegramResult<T>`
* **40+ typed methods** — sending (text/photo/document/audio/video/voice/animation/sticker/location/contact/dice/poll/media group), editing & deleting, forwarding & copying, moderation, pinning, commands and webhook management
* **Event emitters for every `Update` kind** — `onMessage`, `onCallbackQuery`, `onInlineQuery`, `onPoll`, `onChatMember`, … plus a raw `onUpdate` stream and a global `onError`
* **`api()` escape hatch** — call any Bot API method that doesn't have a typed helper yet
* `ChatId` type accepts numeric ids **and** channel `@usernames` (and ids too large for 32-bit)
* Long polling built in (`startPolling`, `stopPolling`) with exponential-backoff reconnect
* Optional `baseUrl` override for self-hosted proxies, optional `debug` logging, and `allowedUpdates` filtering
* Cross-target: JS/Node and the sys targets (C++, HashLink, Neko, Python, JVM), standard library only

See [CHANGELOG.md](CHANGELOG.md) for the full 0.1.2 change list.

## Requirements

* Haxe 4.3+
* Works on JS (incl. Node via `hxnodejs`) and the sys targets — C++ (`hxcpp`),
  HashLink, Neko, Python, JVM. Only the standard library is used (`haxe.Http`,
  `haxe.Json`, `haxe.Timer`), no extra dependencies.

## Install

```bash
haxelib install hxtelegram
```

If you want the development version from GitHub:

```bash
haxelib git hxtelegram https://github.com/mrchaoss1/hxtelegram.git
```

## Environment

Provide your bot token directly in code or load from a config file. Example below uses a local variable.

```haxe
final token = "123456:ABC..."; // required
```

You can also define polling timeout manually.

## Quick start

Minimal echo bot.

```haxe
import telegram.bot.TelegramBot;
import telegram.errors.TelegramError.TelegramResult;
import telegram.types.Message;

class Main {
  static function main() {
    final token = "123456:ABC...";
    if (token == null || token == "") {
      trace('Set TELEGRAM_BOT_TOKEN before running');
      return;
    }

    final bot = new TelegramBot(token);

    // listen for messages
    bot.onMessage.on(function(m:Message) {
      final chatId = m.chat.id;
      final text = m.text != null ? m.text : '';

      // respond to /start
      if (text == '/start') {
        bot.sendMessage(chatId, 'Hello from hxtelegram', null, function(res:TelegramResult<Message>) {
          if (!res.success) trace(res.error);
        });
        return;
      }

      // echo
      bot.sendMessage(chatId, 'You said: ' + text, null, function(res) {
        if (!res.success) trace(res.error);
      });
    });

    // start long polling (20s default)
    bot.startPolling(20);
  }
}
```

### Build and run

A minimal echo-bot example lives in [`example/`](example/) with ready-made hxml
files. Set your token, then build from inside that folder:

```bash
export TELEGRAM_BOT_TOKEN=123456:ABC...   # Windows: set TELEGRAM_BOT_TOKEN=...
cd example

haxe build.hxml       # Node.js  -> bin/Main.js, then runs it with node
haxe build-cpp.hxml   # native C++ -> bin/cpp/Main.exe, then runs it
```

Or invoke the compiler directly (from `example/`); `-cp ..` puts the library on
the classpath:

```bash
# Node.js
haxe -cp .. -cp . -lib hxnodejs -main Main -js bin/Main.js && node bin/Main.js

# Native C++ (needs `haxelib install hxcpp`)
haxe -cp .. -cp . -main Main -cpp bin/cpp && bin/cpp/Main

# Interpreter (quick test, no build)
haxe -cp .. -cp . --interp -main Main
```

> **Polling and your main thread.** On **sys targets** (C++, HashLink, Neko,
> Python, JVM…) `haxe.Http` is synchronous, so `startPolling` runs a blocking
> loop and does not return — put any setup *before* it. On **JS** it is
> asynchronous and returns immediately while the event loop keeps the bot alive.

> **Debugging native crashes.** A null field access that's harmless on JS will
> segfault on *release* hxcpp (`0xC0000005`). Rebuild with `-debug`
> (`haxe -cp .. -cp . -main Main -cpp bin/cppdbg -debug`) and run — hxcpp will
> report the offending file and line instead of crashing silently.

## API overview

Below is the public surface detected in this repo. All methods use explicit callbacks and return `Void`.

### Types

```haxe
typedef BotConfig = {
  ?baseUrl:String,              // API host override
  ?pollTimeout:Int,             // long-poll timeout, seconds
  ?debug:Bool,                  // log HTTP/poll activity via trace()
  ?allowedUpdates:Array<String> // update types to receive (see getUpdates)
}

// Accepts Int, Float or a "@channelusername" String. m.chat.id (Int) fits implicitly.
abstract ChatId(Dynamic) from Int from Float from String to Dynamic {}

enum TelegramError {
  NetworkError(message:String);
  APIError(code:Int, message:String);
  ParseError(message:String);
  ValidationError(message:String);
}

typedef TelegramResult<T> = {
  success:Bool,
  ?data:T,
  ?error:TelegramError
}
```

### Events

Every optional field of `Update` has a matching emitter. Subscribe to as many
as you need; `onUpdate` receives the raw update first, and `onError` fires on
any failed request.

```haxe
class TelegramBot {
  public final onUpdate:EventEmitter<Update>;
  public final onMessage:EventEmitter<Message>;
  public final onEditedMessage:EventEmitter<Message>;
  public final onChannelPost:EventEmitter<Message>;
  public final onEditedChannelPost:EventEmitter<Message>;
  public final onCallbackQuery:EventEmitter<CallbackQuery>;
  public final onInlineQuery:EventEmitter<InlineQuery>;
  public final onChosenInlineResult:EventEmitter<ChosenInlineResult>;
  public final onShippingQuery:EventEmitter<ShippingQuery>;
  public final onPreCheckoutQuery:EventEmitter<PreCheckoutQuery>;
  public final onPurchasedPaidMedia:EventEmitter<PaidMediaPurchased>;
  public final onPoll:EventEmitter<Poll>;
  public final onPollAnswer:EventEmitter<PollAnswer>;
  public final onMyChatMember:EventEmitter<ChatMemberUpdated>;
  public final onChatMember:EventEmitter<ChatMemberUpdated>;
  public final onChatJoinRequest:EventEmitter<ChatJoinRequest>;
  public final onChatBoost:EventEmitter<ChatBoostUpdated>;
  public final onRemovedChatBoost:EventEmitter<ChatBoostRemoved>;
  public final onMessageReaction:EventEmitter<MessageReactionUpdated>;
  public final onMessageReactionCount:EventEmitter<MessageReactionCountUpdated>;
  public final onBusinessConnection:EventEmitter<BusinessConnection>;
  public final onBusinessMessage:EventEmitter<Message>;
  public final onEditedBusinessMessage:EventEmitter<Message>;
  public final onDeletedBusinessMessages:EventEmitter<BusinessMessagesDeleted>;
  public final onError:EventEmitter<TelegramError>;
}
```

### TelegramBot

`SendOptions` is a shared bag of common optional fields (`parse_mode`,
`reply_markup`, `reply_parameters`, `caption`, `disable_notification`,
`protect_content`, `message_thread_id`, `link_preview_options`, …). Methods that
take `?options:{}` accept any extra fields verbatim, so you are never blocked
waiting for a typed helper — and `api()` covers anything else.

```haxe
new(token:String, ?config:BotConfig)
startPolling(?timeoutSec:Int):Void
stopPolling():Void
isPolling():Bool

// generic escape hatch for any Bot API method
api<T>(method:String, ?params:{}, cb:TelegramResult<T> -> Void):Void

// bot / chat info
getMe(cb):Void
getChat(chatId:ChatId, cb):Void
getChatMember(chatId:ChatId, userId:Int, cb):Void
getChatMemberCount(chatId:ChatId, cb):Void
getUserProfilePhotos(userId:Int, ?options:{}, cb):Void
getFile(fileId:String, cb:TelegramResult<File> -> Void):Void
fileLink(filePath:String):String            // download URL for a getFile path

// sending
sendMessage(chatId:ChatId, text:String, ?options:SendOptions, cb):Void
sendPhoto(chatId:ChatId, photo:String, ?caption:String, ?options:SendOptions, cb):Void
sendDocument / sendAudio / sendVideo / sendAnimation / sendVoice / sendSticker(...)
sendLocation(chatId:ChatId, latitude:Float, longitude:Float, ?options:{}, cb):Void
sendContact(chatId:ChatId, phoneNumber:String, firstName:String, ?options:{}, cb):Void
sendDice(chatId:ChatId, ?emoji:String, ?options:{}, cb):Void
sendPoll(chatId:ChatId, question:String, options:Array<Dynamic>, ?extra:{}, cb):Void
sendChatAction(chatId:ChatId, action:String, ?options:{}, cb):Void
sendMediaGroup(chatId:ChatId, media:Array<Dynamic>, ?options:{}, cb):Void

// forward / copy / edit / delete
forwardMessage(chatId:ChatId, fromChatId:ChatId, messageId:Int, ?options:{}, cb):Void
copyMessage(chatId:ChatId, fromChatId:ChatId, messageId:Int, ?options:{}, cb):Void
editMessageText(chatId:ChatId, messageId:Int, text:String, ?options:SendOptions, cb):Void
editMessageCaption(chatId:ChatId, messageId:Int, ?caption:String, ?options:SendOptions, cb):Void
editMessageReplyMarkup(chatId:ChatId, messageId:Int, ?replyMarkup:{}, cb):Void
deleteMessage(chatId:ChatId, messageId:Int, cb):Void
deleteMessages(chatId:ChatId, messageIds:Array<Int>, cb):Void
setMessageReaction(chatId:ChatId, messageId:Int, ?reaction:Array<Dynamic>, ?isBig:Bool, cb):Void

// pinning
pinChatMessage / unpinChatMessage / unpinAllChatMessages(...)

// moderation
banChatMember / unbanChatMember / restrictChatMember / leaveChat(...)

// callback / inline / commands / webhook
answerCallbackQuery(id:String, ?text:String, ?showAlert:Bool, ?url:String, ?cacheTime:Int, cb):Void
answerInlineQuery(inlineQueryId:String, results:Array<Dynamic>, ?options:{}, cb):Void
setMyCommands / getMyCommands / deleteMyCommands(...)
setWebhook / deleteWebhook / getWebhookInfo(...)
```

> Note: Every call requires a callback. If you see
> `Not enough arguments, expected cb: TelegramResult<...> -> Void`,
> pass a function with the correct signature.

## Inline keyboard example

```haxe
import telegram.types.InlineKeyboardMarkup;

final kb:InlineKeyboardMarkup = {
  inline_keyboard: [
    [ { text: 'Ping', callback_data: 'ping' } ],
    [ { text: 'Open', url: 'https://example.com' } ]
  ]
};

bot.sendMessage(chatId, 'Choose:', { reply_markup: kb }, function(res) {
  if (!res.success) trace(res.error);
});

bot.onCallbackQuery.on(function(q) {
  // acknowledge the tap
  bot.answerCallbackQuery(q.id, 'Pong', false, null, 0, function(r) {});
});
```

## Receiving updates

This client provides long polling. Use `startPolling()` and subscribe to any of
the `on*` emitters. You can narrow what the server sends with `allowedUpdates`:

```haxe
final bot = new TelegramBot(token, { allowedUpdates: ["message", "callback_query"] });

bot.onMessage.on(m -> trace('msg from ' + m.chat.id));
bot.onInlineQuery.on(q -> bot.answerInlineQuery(q.id, [], r -> {}));
bot.onPoll.on(p -> trace('poll update'));
bot.onError.on(e -> trace('request failed: ' + e)); // global failure hook

bot.startPolling(20);
```

Polling reconnects automatically with exponential backoff (1s → 30s) when a
cycle fails. For **webhooks**, the registration endpoints are provided
(`setWebhook`, `deleteWebhook`, `getWebhookInfo`) — you still supply your own
HTTP server to receive the `Update` payloads.

## Calling methods without a helper

Anything not yet wrapped is one `api()` call away — it's fully typed by the
result you expect:

```haxe
import telegram.types.User;

bot.api("getMe", function(res:TelegramResult<User>) {
  if (res.success) trace('I am @' + res.data.username);
});

// any extra params go in the second argument
bot.api("setChatTitle", { chat_id: chatId, title: "New title" }, function(res:TelegramResult<Bool>) {
  if (!res.success) trace(res.error);
});
```

## Error handling

All callbacks receive `TelegramResult<T>`. You can also subscribe to `onError`
for a single place to observe every failure.

```haxe
function onSent(res:TelegramResult<Message>) {
  if (res.success) trace('sent: ' + res.data.message_id);
  else switch (res.error) {
    case NetworkError(m): trace('network: ' + m);
    case APIError(code, m): trace('api ' + code + ': ' + m);
    case ParseError(m) | ValidationError(m): trace(m);
  }
}
```

## Project layout

* `telegram/bot/TelegramBot.hx` — client, polling and all API methods
* `telegram/types/*` — typed Telegram models (incl. `ChatId`)
* `telegram/events/EventEmitter.hx` — tiny event utility
* `telegram/errors/*` — error and result types
* `telegram/tools/*` — additional helpers *(still in dev)*
* `example/` — minimal echo-bot with `build.hxml` / `build-cpp.hxml`
* `CHANGELOG.md` — version history

## Roadmap / Tasks

- [x] Add new tools — 40+ typed API endpoints, generic `api()`, and webhook registration *(0.1.2)*
- [x] Improve error recovery and reconnect logic — exponential-backoff polling + `onError` *(0.1.2)*
- [x] Support channel `@usernames` and large chat ids via `ChatId` *(0.1.2)*
- [ ] Multipart upload of local files (currently file_id / URL only)
- [ ] Built-in webhook server helper
- [ ] Extend documentation with more real-world examples
- [ ] Provide optional async API ~*(never)*~

## FAQ

**What type is `chatId`?**  
The `ChatId` type, which accepts an `Int`, a `Float` or a `@channelusername`
`String`. An `Int` (e.g. `message.chat.id`) passes implicitly, so simple code
just keeps using ints; pass a `Float`/`String` for channel usernames or for
supergroup/channel ids that overflow signed 32-bit.

**Can I change the API host?**  
Yes. Pass `baseUrl` in `BotConfig`.

**My bot crashes on C++ with `0xC0000005` but works on JS.**  
That's a null field access (harmless `undefined` on JS, a hard segfault on
release hxcpp). Rebuild with `-debug` to get the exact file and line — see
[Build and run](#build-and-run).

## License

MIT. Look at the `LICENSE`.
