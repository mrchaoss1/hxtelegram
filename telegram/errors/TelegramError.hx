package telegram.errors;

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
