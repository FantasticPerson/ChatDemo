/**
 * Created by dandanwu on 15/5/15.
 */
package {
    import flash.display.Bitmap;

    import starling.display.Image;

    public class picList {
        public function picList() {
        }

        public static const Instance:picList = new picList();

        public static const pic1:String = " *0* ";
        public static const pic2:String = "@01";
        public static const pic3:String = "@02";
        public static const pic4:String = "@03";
        public static const pic5:String = "@04";
        public static const pic6:String = "@05";
        public static const pic7:String = "@06";
        public static const pic8:String = "@07";
        public static const pic9:String = "@08";

        [Embed(source="/color100001.png")]
        private var Pic1:Class;

        [Embed(source="/color20001.png")]
        private var Pic2:Class;

        [Embed(source="/color30001.png")]
        private var Pic3:Class;

        [Embed(source="/color40001.png")]
        private var Pic4:Class;

        [Embed(source="/color50001.png")]
        private var Pic5:Class;

        [Embed(source="/color60001.png")]
        private var Pic6:Class;

        [Embed(source="/color70001.png")]
        private var Pic7:Class;

        [Embed(source="/color80001.png")]
        private var Pic8:Class;

        [Embed(source="/color90001.png")]
        private var Pic9:Class;

        public function get picture1():Bitmap
        {
            return new Pic1();
        }

        public function get picture2():Bitmap
        {
            return new Pic2();
        }

        public function get picture3():Bitmap
        {
            return new Pic3();
        }

        public function get picture4():Bitmap
        {
            return new Pic4();
        }

        public function get picture5():Bitmap
        {
            return new Pic5();
        }

        public function get picture6():Bitmap
        {
            return new Pic6();
        }

        public function get picture7():Bitmap
        {
            return new Pic7();
        }

        public function get picture8():Bitmap
        {
            return new Pic8();
        }

        public function get picture9():Bitmap
        {
            return new Pic9();
        }
    }
}
