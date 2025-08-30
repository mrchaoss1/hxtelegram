package telegram.data.messages;

import telegram.data.base.User;

typedef MessageEntity = {
    type:String,
    offset:Int,
    length:Int,
    ?url:String,
    ?user:User,
    ?language:String
}
