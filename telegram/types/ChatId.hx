package telegram.types;

abstract ChatId(Dynamic) from Int from Float from String to Dynamic {
    inline public function new(v:Dynamic) this = v;

    public inline function isUsername():Bool return Std.isOfType(this, String);

    public inline function toString():String return Std.string(this);
}
