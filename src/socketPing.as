/**
 * Created by dandanwu on 15/7/1.
 */
package {
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.Socket;
    import flash.utils.Timer;
    import flash.utils.getTimer;

    import flash.net.DatagramSocket;

    public class socketPing extends Socket {

        var servername:String = "http://www.baidu.com/";
        var portnumber:int = 80;
//        var _sock:Socket;
//        var _timer:Timer = new Timer(2000);
        var _startTime:Number;
        var _stopTime:Number;

        function onConnect(evt:Event):void {
            _stopTime = getTimer();
            trace(_stopTime - _startTime);
            ping();
//            tServerInfo.text = "Verbinden met " + servername;
        }

//        function onSocketData(event:ProgressEvent):void {
//            var socketdata:String;
//            while(_sock.bytesAvailable) {
//                socketdata = _sock.readUTFBytes(_sock.bytesAvailable);
////                trace(socketdata);
//                _stopTime = getTimer();
//                trace(_startTime);
//                trace(_stopTime);
//                trace(_stopTime - _startTime);
////                tServerInfo.text = socketdata;
//            }
//            ping();
//        }

        private function ping():void{
            super.connect(servername,portnumber);
//            _sock.connect(servername, portnumber);
            _startTime = getTimer();
//            trace(_startTime);
        }

        public function socketPing(servername:String = null,portnumber:int=0) {
            super();
            this.addEventListener(Event.CONNECT, onConnect);

//            _sock = new Socket("localhost",80);

//            _sock.addEventListener(ProgressEvent.SOCKET_DATA, onSocketData);
            ping();
//            _sock.connect(servername, portnumber);
        }
    }


}
