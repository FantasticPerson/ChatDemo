/**
 * Created by dandanwu on 15/5/18.
 */
package {
    import flash.events.Event;

    public class changeEvent extends Event {

        public static const BACKSPACE_KEY_EVENT:String = "backspace key event";
        public static const DLETE_KEY_EVENT:String = "delete key event";
        public static const INSERT_EVENT:String = "insert event";
        public var isImg:Boolean = false;

        public function changeEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false) {
            super(type,bubbles,cancelable);
        }
    }
}
