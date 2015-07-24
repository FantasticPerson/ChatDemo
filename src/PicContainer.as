/**
 * Created by dandanwu on 15/5/15.
 */
package {
    import flash.display.Bitmap;
    import flash.display3D.textures.Texture;

    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Point;

    public class PicContainer extends Sprite {

        private var _pic1:Bitmap;
        private var _pic2:Bitmap;
        private var _pic3:Bitmap;
        private var _pic4:Bitmap;
        private var _pic5:Bitmap;
        private var _pic6:Bitmap;
        private var _pic7:Bitmap;
        private var _pic8:Bitmap;
        private var _pic9:Bitmap;

        public function PicContainer() {
            super();
            _pic1 = picList.Instance.picture1;
            _pic1.name = picList.pic1;
            _pic2 = picList.Instance.picture2;
            _pic2.name = picList.pic2;
            _pic3 = picList.Instance.picture3;
            _pic3.name = picList.pic3;
            _pic4 = picList.Instance.picture4;
            _pic4.name = picList.pic4;
            _pic5 = picList.Instance.picture5;
            _pic5.name = picList.pic5;
            _pic6 = picList.Instance.picture6;
            _pic6.name = picList.pic6;
            _pic7 = picList.Instance.picture7;
            _pic7.name = picList.pic7;
            _pic8 = picList.Instance.picture8;
            _pic8.name = picList.pic8;
            _pic9 = picList.Instance.picture9;
            _pic9.name = picList.pic9;

            trace(_pic9.width);

            addChild(_pic1);
            addChild(_pic2);
            addChild(_pic3);
            addChild(_pic4);
            addChild(_pic5);
            addChild(_pic6);
            addChild(_pic7);
            addChild(_pic8);
            addChild(_pic9);

            var x:Number = 0;
            _pic1.x = x;
            x += (_pic1.width + 5);
            _pic2.x = x;
            x += (_pic2.width + 5);
            _pic3.x = x;
            x += (_pic3.width + 5);
            _pic4.x = x;
            x += (_pic4.width + 5);
            _pic5.x = x;
            x += (_pic5.width + 5);
            _pic6.x = x;
            x += (_pic6.width + 5);
            _pic7.x = x;
            x += (_pic7.width + 5);
            _pic8.x = x;
            x += (_pic8.width + 5);
            _pic9.x = x;
            x += (_pic8.width + 5);
        }
    }
}
