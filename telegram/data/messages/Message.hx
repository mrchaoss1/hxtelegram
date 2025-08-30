package telegram.data.messages;

import telegram.data.base.User;
import telegram.data.base.Chat;
import telegram.data.messages.MessageEntity;

typedef Message = {
    message_id:Int,
    date:Int,
    chat:Chat,
    ?from:User,
    ?text:String,
    ?entities:Array<MessageEntity>,
    ?caption:String
}
