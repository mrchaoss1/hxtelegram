package telegram.data.base;

typedef TelegramResponse<T> = {
    ok:Bool,
    ?result:T,
    ?description:String,
    ?error_code:Int,
    ?parameters:ResponseParameters
}

typedef ResponseParameters = {
    ?migrate_to_chat_id:Int,
    ?retry_after:Int
}
