# hxtelegram

Typed Telegram Bot API client for Haxe. Focused on Node.js (hxnodejs) targets. Ships simple long‑polling, typed models, and event helpers.

## Features

* Haxe 4.3+ types for common Telegram objects (Message, User, Chat, Update, CallbackQuery, File, InlineKeyboard…)
* Minimal API surface with explicit callbacks via `TelegramResult<T>`
* Event emitters: `onMessage`, `onCallbackQuery`
* Long polling built in (`startPolling`, `stopPolling`)
* Optional `baseUrl` override for self‑hosted proxies

## Requirements

* Haxe 4.3+
* Node.js **18+**
* Library: `hxnodejs`

## Install

Add sources to your build path or set up a dev lib:

```bash
haxelib install hxnodejs
# If this repo is local
haxelib git hxtelegram https://github.com/mrchaoss1/hxtelegram.git
```

## Environment

Create a `.env` file next to your `Main.hx` or export env vars via your shell.

```dotenv
TELEGRAM_BOT_TOKEN=123456:ABC... # required

# Optional
POLL_TIMEOUT=20                  # seconds
```

Load with your own env loader or `Sys.getEnv` directly. Example below reads process env.

## Quick start

Minimal echo bot for Node.js target.

```haxe
import telegram.bot.TelegramBot;
import telegram.errors.TelegramError.TelegramResult;
import telegram.data.messages.Message;

class Main {
  static function main() {
    final token = Sys.getEnv('TELEGRAM_BOT_TOKEN');
    if (token == null || token == "") {
      trace('Set TELEGRAM_BOT_TOKEN in your environment');
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
    bot.startPolling(Std.parseInt(Sys.getEnv('POLL_TIMEOUT')));
  }
}
```

### Build and run (hxnodejs)

```bash
# Compile to Node.js
haxe -lib hxnodejs -cp src -main Main -js bin/Main.js
# Run
node bin/Main.js
```

## API overview

Below is the public surface detected in this repo. All methods use explicit callbacks and return `Void`.

### Types

```haxe
typedef BotConfig = {
  ?baseUrl:String,   // API host override
  ?pollTimeout:Int   // seconds
}

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

```haxe
class TelegramBot {
  public final onMessage:EventEmitter<Message>;
  public final onCallbackQuery:EventEmitter<CallbackQuery>;
}
```

### TelegramBot

```haxe
new(token:String, ?config:BotConfig)
startPolling(?timeoutSec:Int):Void
stopPolling():Void

sendMessage(
  chatId:Int,
  text:String,
  ?params:{ ?parse_mode:String, ?reply_markup:InlineKeyboardMarkup },
  cb:TelegramResult<Message> -> Void
):Void

sendPhoto(
  chatId:Int,
  photoUrl:String,
  ?caption:String,
  cb:TelegramResult<Message> -> Void
):Void

getFile(fileId:String, cb:TelegramResult<File> -> Void):Void

answerCallbackQuery(
  id:String,
  ?text:String,
  ?showAlert:Bool,
  ?url:String,       // optional URL for game/Deep-Link use cases
  ?cacheTime:Int,
  cb:TelegramResult<Bool> -> Void
):Void
```

> Note: Every call requires a callback. If you see
> `Not enough arguments, expected cb: TelegramResult<...> -> Void`,
> pass a function with the correct signature.

## Inline keyboard example

```haxe
import telegram.data.replymarkup.InlineKeyboardMarkup;

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

This client provides long polling. Use `startPolling()` and subscribe to `onMessage` and `onCallbackQuery`. Webhook helpers are not included in this repo.

## Error handling

All callbacks receive `TelegramResult<T>`.

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

* `telegram/bot/TelegramBot.hx` — client and polling
* `telegram/data/*` — typed Telegram models
* `telegram/events/EventEmitter.hx` — tiny event utility
* `telegram/errors/*` — error and result types

## FAQ

**Why do methods take `Int` for `chatId`?**
Telegram chat IDs fit in signed 32‑bit for typical private and group chats. Keep them as `Int` in Haxe to avoid `Float -> Int` issues.

**Can I change the API host?**
Yes. Pass `baseUrl` in `BotConfig`.

## License

MIT. Look at the `LICENSE`.
