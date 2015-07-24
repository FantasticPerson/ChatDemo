/**
 * Created by dandanwu on 15/6/17.
 */
package {
    import flash.display.BitmapData;
    import flash.display.Shape;

    import starling.display.Button;

    import starling.display.Sprite;
    import starling.textures.Texture;

    public class shapDemo extends starling.display.Sprite {

        private var _shape:flash.display.Shape;

        public function shapDemo() {
            _shape = new Shape();
            _shape.graphics.beginFill(0,0.2);
            _shape.graphics.drawRoundRect(0,0,100,100,0,0);
            _shape.graphics.endFill();

            var bitdata:BitmapData = new BitmapData(_shape.width,_shape.height);
            bitdata.draw(_shape);

            var texture:starling.textures.Texture = starling.textures.Texture.fromBitmapData(bitdata);
            var btn:Button = new Button(texture);
            btn.x = 50;
            btn.y = 50;
            this.addChild(btn);

//            var ss:netStatusDemo = new netStatusDemo("http://www.baidu.com");
//            ss.check();

//            try {
                var kk:socketPing = new socketPing();
//            } catch(e:*){
//
//            }
        }
    }
}
