package telegram.data.keyboard;

typedef InlineKeyboardButton = {
    text:String,
    ?url:String,
    ?callback_data:String,
    ?switch_inline_query:String,
    ?switch_inline_query_current_chat:String
}

typedef InlineKeyboardMarkup = {
    inline_keyboard:Array<Array<InlineKeyboardButton>>
}
