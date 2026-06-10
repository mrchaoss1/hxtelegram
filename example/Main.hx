import telegram.bot.TelegramBot;
import telegram.errors.TelegramError.TelegramResult;
import telegram.types.Message;

class Main {
    static function main() {
        final token = Sys.getEnv("TELEGRAM_BOT_TOKEN");
        if (token == null || token == "") {
            Sys.println("Set TELEGRAM_BOT_TOKEN before running.");
            return;
        }

        final bot = new TelegramBot(token);

        bot.onMessage.on(function(m:Message) {
            final text = m.text != null ? m.text : "";
            final reply = text == "/start" ? "Hello from hxtelegram!" : "You said: " + text;
            bot.sendMessage(m.chat.id, reply, null, function(res:TelegramResult<Message>) {
                if (!res.success) trace(res.error);
            });
        });

        bot.onError.on(e -> trace("request failed: " + e));

        Sys.println("Bot started. Press Ctrl+C to stop.");
        bot.startPolling(20);
    }
}
