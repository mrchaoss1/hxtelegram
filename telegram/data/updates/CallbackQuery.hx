package telegram.data.updates;

import telegram.data.base.User;
import telegram.data.messages.Message;

typedef CallbackQuery = {
    id:String,
    from:User,
    ?message:Message,
    ?inline_message_id:String,
    ?chat_instance:String,
    ?data:String,
    ?game_short_name:String
}
