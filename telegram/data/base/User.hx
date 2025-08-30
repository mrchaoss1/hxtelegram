package telegram.data.base;

typedef User = {
    id:Int,
    is_bot:Bool,
    first_name:String,
    ?last_name:String,
    ?username:String
}
