package telegram.events;

typedef EventHandler<T> = T -> Void;

class EventEmitter<T> {
    private var handlers:Array<EventHandler<T>> = [];

    public function new() {}

    public function on(h:EventHandler<T>):Void handlers.push(h);

    public function off(h:EventHandler<T>):Bool {
        for (i in 0...handlers.length) {
            if (Reflect.compareMethods(handlers[i], h)) {
                handlers.splice(i, 1);
                return true;
            }
        }
        return false;
    }

    public function emit(v:T):Void {
        for (h in handlers) {
            try h(v) catch (e:Dynamic) trace('Event handler error: $e');
        }
    }

    public function clear():Void handlers = [];
}
