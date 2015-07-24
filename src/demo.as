/**
 * Created by dandanwu on 15/5/18.
 */
package {

    import starling.display.Sprite;

    public class demo extends starling.display.Sprite {
        var textField:chatPanel = new chatPanel(300,400,"","Arial",20);
        var picList:PicContainer = new PicContainer();
        public function demo() {
            super();

            textField.x = 50;
            textField.y = 50;

            addChild(textField);

            textField.setPicContainer(picList);
        }

    }
}
