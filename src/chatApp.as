/**
 * Created by dandanwu on 15/5/14.
 */
package {
    import flash.display.Sprite;

    import starling.core.Starling;
//
//    [SWF(width="1024", height="768", frameRate="30", backgroundColor="#ffffff")]
//    public class chatApp extends Sprite{
//        private var _starling:Starling;
//
//        public function chatApp() {
//            _starling = new Starling(chatPanel,stage);
//            _starling.start();
//        }
//    }

    [SWF(width="400", height="300", frameRate="60", backgroundColor="#ffffff")]
    public class chatApp extends Sprite
    {
        private var _starling:Starling;

        public function chatApp()
        {
            _starling = new Starling(demo, stage);
//            _starling = new Starling(shapDemo, stage);
            _starling.start();

//            trace( _starling.contentScaleFactor);
        }
    }
}
