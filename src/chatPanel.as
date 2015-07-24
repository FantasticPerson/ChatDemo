/**
 * Created by dandanwu on 15/5/14.
 */
package {
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.text.TextField;
    import flash.text.TextFieldType;
    import flash.text.TextFormat;

    import starling.core.Starling;

    import starling.text.TextField;
    import starling.utils.HAlign;
    import starling.utils.VAlign;

    public class chatPanel extends starling.text.TextField{

        private var textField:flash.text.TextField;

        private var _picList:PicContainer;
        private var _currentIndex:int;

        private var _picArr:Array = [];
        private var textFormat:TextFormat;

        public function chatPanel(a:int,a2:int,a3:String,a4:String = "Verdana",a5:Number = 12,a6:uint = 0,a7:Boolean = false) {

            textField = new flash.text.TextField();
            textFormat = textField.defaultTextFormat;

            textField.alpha = 0;
            textField.width = a;
            textField.height = a2;
            textField.x = this.x;
            textField.y = this.y;
            textField.multiline = true;
            textField.wordWrap = true;
            textFormat.font = a4;
            textFormat.size = a5;
            textField.defaultTextFormat = textFormat;
            textField.setTextFormat(textFormat);
            textField.text = a3;
            textField.type = TextFieldType.INPUT;

            textField.addEventListener(Event.CHANGE,onTextChange);
            textField.addEventListener(MouseEvent.CLICK, onClicked);
            textField.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
            textField.addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
            textField.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            textField.addEventListener(changeEvent.BACKSPACE_KEY_EVENT,onTextChange);
            textField.addEventListener(changeEvent.DLETE_KEY_EVENT,onTextChange);
            textField.addEventListener(changeEvent.INSERT_EVENT,onTextChange);

            super(a,a2,a3,a4,a5,a6,a7);
            this.vAlign = VAlign.TOP;
            this.hAlign = HAlign.LEFT;

            this.addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
            this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
        }

        public function setPicContainer(picContainer:PicContainer):void{
            _picList = picContainer;

            _picList.x = 200;
            _picList.y = 500;
            Starling.current.nativeOverlay.addChild(_picList);
            _picList.addEventListener(MouseEvent.CLICK, onClick);
        }

        private function onAddedToStage(e:*):void{
            var point:Point = this.localToGlobal(new Point(0,0));
            textField.x = point.x;
            textField.y = point.y;

//            textField.x = 400;
//            textField.y = 100;
            Starling.current.nativeOverlay.addChild(textField);
        }

        private function onRemoveFromStage(e:*):void {
            if(Starling.current.nativeOverlay.contains(textField))
                Starling.current.nativeOverlay.removeChild(textField);
        }

        override public function set width(a:Number):void{
            textField.width = a;
            super.width = a;
        }

        override public function set height(a:Number):void{
            textField.height = a;
            super.height = a;
        }

        override public function set fontName(a:String):void{
            textFormat.font = a;
            textField.defaultTextFormat = textFormat;
            textField.setTextFormat(textFormat);
            super.fontName = a;
        }

        override public function set fontSize(a:Number):void{
            textFormat.size = a;
            textField.defaultTextFormat = textFormat;
            textField.setTextFormat(textFormat);
            super.fontSize = a;
        }

        override public function set color(a:uint):void{
            textFormat.color = a;
            textField.defaultTextFormat = textFormat;
            textField.setTextFormat(textFormat);
            super.color = a;
        }

        override public function set text(a:String):void{
            textField.text = a;
            super.text = a;
        }

        private function onKeyDown(e:KeyboardEvent):void{
            trace(e.keyCode);
            if(e.keyCode == 37 || e.keyCode == 39 || e.keyCode == 8 || e.keyCode == 46 || e.keyCode == 13){
                e.preventDefault();
                if(e.keyCode == 37){
                    letfHandler();
                }
                else if(e.keyCode == 39){
                    rightHandler();
                }
                else if(e.keyCode == 8){
                    backSpaceHandler();
                }
                else if(e.keyCode == 46){
                    deleteHandler();
                }
            }
        }

        private function backSpaceHandler():void{
            _currentIndex = textField.caretIndex;
            if(_currentIndex == 0){
                return;
            }
            var isImg:Boolean = false;
            for(var i:int = 0;i<_picArr.length;i++){
                var imgInfo:Array = _picArr[i];
                if(imgInfo[1]+5 == _currentIndex){
                    isImg = true;
                    Starling.current.nativeOverlay.removeChild(imgInfo[2] as Bitmap);
                    textField.text = deleteString(textField.text,imgInfo[1],(imgInfo[0] as String).length);
                    setCursorIndex(_currentIndex-picList.pic1.length);
                    _currentIndex = _currentIndex-picList.pic1.length;
                    _picArr.splice(i,1);
                    break;
                }
            }
            if(!isImg){
                textField.text = deleteString(textField.text,_currentIndex-1,1);
                setCursorIndex(_currentIndex-1);
                _currentIndex = _currentIndex-1;
            }
            textField.dispatchEvent(createEvent(changeEvent.BACKSPACE_KEY_EVENT,isImg));
        }

        private function deleteHandler():void{
            _currentIndex = textField.caretIndex;
            if(_currentIndex == textField.text.length){
                return;
            }
            var isImg:Boolean = false;
            for(var i:int = 0;i<_picArr.length;i++){
                var imgInfo:Array = _picArr[i];
                if(imgInfo[1] == _currentIndex){
                    isImg = true;
                    Starling.current.nativeOverlay.removeChild(imgInfo[2] as Bitmap);
                    textField.text = deleteString(textField.text,imgInfo[1],(imgInfo[0] as String).length);
                    _picArr.splice(i,1);
                    break;
                }
            }
            if(!isImg){
                textField.text = deleteString(textField.text,_currentIndex,1);
            }
            textField.dispatchEvent(createEvent(changeEvent.DLETE_KEY_EVENT,isImg));
        }

        private function rightHandler():void{
            var isImg:Boolean = false;
            _currentIndex = textField.caretIndex;
            for(var i:int = 0;i<_picArr.length;i++){
                var imgInfo:Array = _picArr[i];
                if(_currentIndex >= imgInfo[1] && _currentIndex < imgInfo[1]+imgInfo[0].length){
                    isImg = true;
                    setCursorIndex(imgInfo[1]+imgInfo[0].length);
                    _currentIndex = imgInfo[1]+imgInfo[0].length;
                }
            }
            if(!isImg){
                setCursorIndex(_currentIndex+1);
                _currentIndex = _currentIndex + 1;
            }
        }

        private function letfHandler():void{
            var isImg:Boolean = false;
            _currentIndex = textField.caretIndex;
            for(var i:int = 0;i<_picArr.length;i++){
                var imgInfo:Array = _picArr[i];
                if(_currentIndex > imgInfo[1] && _currentIndex <= imgInfo[1]+imgInfo[0].length){
                    isImg = true;
                    setCursorIndex(imgInfo[1]);
                    _currentIndex = imgInfo[1];
                }
            }
            if(!isImg){
                setCursorIndex(_currentIndex-1);
                _currentIndex = _currentIndex - 1;
            }
        }

        private function onFocusIn(e:*):void{
//            trace("focus in ");
        }

        private function onFocusOut(e:*):void{
//            trace("focus out");
        }

        private function onClicked(e:*):void
        {
            _currentIndex = textField.caretIndex;
            for(var i:int = 0;i<_picArr.length;i++) {
                var imgInfo:Array = _picArr[i];
                if(imgInfo[1] < _currentIndex && (imgInfo[1]+imgInfo[0].length) > _currentIndex){
                    setCursorIndex(imgInfo[1]+imgInfo[0].length);
                    break;
                }
            }
        }

        private function onTextChange(e:Event):void
        {
            var originIndex:int = _currentIndex;
            this.text = textField.text;
            _currentIndex = textField.caretIndex;
            var moveLength:int = 1;
            if(e.type == changeEvent.BACKSPACE_KEY_EVENT || e.type == changeEvent.DLETE_KEY_EVENT){
                if((e as changeEvent).isImg)
                    moveLength = 5;
                for(var k:int = 0 ;k<_picArr.length;k++){
                    var imgInfo3:Array = _picArr[k];
                    if(imgInfo3[1] > _currentIndex){
                        imgInfo3[1] = imgInfo3[1]-moveLength;
                    }
                }
            }

            else if(e.type == changeEvent.INSERT_EVENT){

                if((e as changeEvent).isImg){
                    moveLength = 5;
                    for(var j:int = 0 ;j<_picArr.length;j++){
                        var imgInfo2:Array = _picArr[j];
                        if(imgInfo2[1] > _currentIndex){
                            imgInfo2[1] = imgInfo2[1]+moveLength;
                        }
                    }
                }
            }

            else if(e.type == Event.CHANGE){
                for(var i:int = 0;i<_picArr.length;i++){
                    var imgInfo:Array = _picArr[i];
                    if(imgInfo[1] >= originIndex-1){
                        imgInfo[1] = imgInfo[1] + _currentIndex-originIndex;
                    }
                }
            }
            updatePIC();
        }

        private function onClick(e:*):void{
            var arr:Array = [picList.pic1,_currentIndex,];
            _picArr.push(arr);
            textField.text = insertString(textField.text,picList.pic1,_currentIndex);
            Starling.current.nativeStage.focus = textField;
            setCursorIndex(_currentIndex+picList.pic1.length);
            _currentIndex = _currentIndex+picList.pic1.length;
            textField.dispatchEvent(createEvent(changeEvent.INSERT_EVENT,true));
        }

        private function updatePIC():void{
            if(_picArr && _picArr.length > 0)
            {
                for(var i:int = 0;i<_picArr.length;i++)
                {
                    var picInfo:Array = _picArr[i];
                    var rect:Rectangle = textField.getCharBoundaries(picInfo[1]+1);
                    var rect1:Rectangle = textField.getCharBoundaries(picInfo[1]+picInfo[0].length-2);
                    var img:Bitmap;
                    if(!picInfo[2]){
                        img = picList.Instance.picture1;
                        picInfo[2] = img;
                    }
                    else{
                        img = picInfo[2];
                    }
                    img.height = rect.height;
                    img.width = rect1.x-rect.x+rect1.width;

                    img.x = this.x + rect.x;
                    img.y = this.y + rect.y;
                    Starling.current.nativeOverlay.addChild(img);
                }
            }
        }

        private function insertString(str:String,insertStr:String,index:int):String{
            return str.substring(0,index).concat(insertStr).concat(str.substring(index,str.length));
        }

        private function deleteString(str:String,index:int,length:int):String{
            return str.substring(0,index).concat(str.substring(index+length,str.length));
        }

        private function setCursorIndex(index:int):void{
            textField.setSelection(index,index);
        }

        private function createEvent(str:String,isImg:Boolean=false):changeEvent{
            var event:changeEvent = new changeEvent(str);
            event.isImg = isImg;
            return event;
        }
    }
}
