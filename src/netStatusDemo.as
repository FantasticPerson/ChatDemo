
/**
 * Created by dandanwu on 15/6/18.
 * 检测网络时延
 */
package{
    import flash.events.HTTPStatusEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.clearTimeout;
    import flash.utils.getTimer;
    import flash.utils.setTimeout;


    public class netStatusDemo {
        private var _url:String;

        private var _time_start:Number;
        private var _time_stop:Number;
        private var _times:int;
        private var _ldr:URLLoader;

        public function netStatusDemo(url:String) {
            _url = url;
            try {
                _ldr = new URLLoader();
                _ldr.addEventListener(HTTPStatusEvent.HTTP_STATUS, ldrStatus);
            } catch(e:*) {

            }
        }

        public function check():void
        {
            trace("pinging", _url);

            _times = 0;
            doThePing();
        }

        private function doThePing():void
        {
            _time_start = getTimer();
            _ldr.load(new URLRequest(_url));
        }

        private function ldrStatus(evt:*):void
        {
            if(evt.status == 200)
            {
                _time_stop = getTimer();
                trace("got response in", _time_stop - _time_start, "ms");
            }
            var id:int = setTimeout(function():void{
                doThePing();
                clearTimeout(id);
            },1500);
        }

        private function getStatus(delay:int):int{
            var status:int;
            if(delay < 150)         status = 4;
            else if(delay < 300)    status = 3;
            else if(delay <1000)    status = 2;
            else if(delay < 2000)   status = 1;
            else                    status = 0;

            return status;
        }
    }
}
