package telegram.base;

import telegram.types.ResponseParameters;

typedef TelegramResponse<T> = {
    ok:Bool,
    ?result:T,
    ?description:String,
    ?error_code:Int,
    ?parameters:ResponseParameters
}