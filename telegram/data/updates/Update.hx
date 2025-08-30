package telegram.data.updates;

import telegram.data.messages.Message;
import telegram.data.updates.CallbackQuery;

typedef Update = {
    update_id:Int,
    ?message:Message,
    ?edited_message:Message,
    ?channel_post:Message,
    ?edited_channel_post:Message,
    ?callback_query:CallbackQuery
}
