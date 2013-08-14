package ui
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class Button extends Sprite
	{
        // 按钮组件
        private var _btn:Sprite;
        private var _btnMask:Sprite;

        // 按钮文本
        private var _btnTxt:TextField;
        private var _btnTxtFormat:TextFormat;

        // 按钮样式
        private var _width:int;
        private var _height:int;
        private var _btnBg:uint;
        private var _btnOver:uint;
        private var _btnClickDown:uint;
        private var _btnClickUp:uint;
        
        // 按钮文本样式
        private var _text:String;
        private var _btnTxtBg:uint;
        private var _btnTxtOver:uint;
        private var _btnTxtClickDown:uint;
        private var _btnTxtClickUp:uint;
        private var _fontSize:int;
		private var _btnBorder:int;
		private var _btnBorderColor:uint;
		private var _btnBorderRadius:int;

        // 参数列表
        private var _options:Object = {};

        // 默认参数列表
        private var _default:Object = {
            _width: 60,
            _height: 30,
            _text: "发送",
            _btnBg: 0xF49909,
            _btnOver: 0xFDAA24,
            _btnClickDown: 0xFDAA24,
            _btnClickUp: 0xFDAA24,
            _btnTxtBg: 0xFFFFFF,
            _btnTxtOver: 0xFFFFFF,
            _btnTxtClickDown: 0xFFFFFF,
            _btnTxtClickUp: 0xFFFFFF,
            _fontSize: 12,
			
			_btnBorder: 0,
			_btnBorderColor: 0xFFFFFF,
			_btnBorderRadius: 0
        };

		public function Button(options:Object)
		{
			super();

            _options = extend(options, _default);

			console(_options);
			addChildren();
			draw();
		}
		
        /*
         * @method 打印对象中的属性
         */
		public function console(obj:Object):void {
			trace("{\n");
			for (var item in obj) {
				trace("  " + item + ": " + obj[item] + "\n");
			}
			trace("}\n")
		}

        /*
         * @method 合并默认参数和传递参数
         */
        private function extend(des:Object, sor:Object):Object {
            for (var _item in sor) {
                if (!des[_item]) {
                    des[_item] = sor[_item];
                }
            }

            return des;
        }
		
        /*
         * @method 确定舞台上需要添加的对象
         */
		private function addChildren():void {
			_btn = new Sprite();
			_btnMask = new Sprite();
			_btnTxt = new TextField();
			
			_btn.addChild(_btnTxt);
			_btn.addChild(_btnMask);
			
			addChild(_btn);
		}
		
        /*
         * @method 实现舞台上需要添加的对象
         */
		private function draw():void {
			drawBg(_options._btnBg);
			drawBtnTxt();
			drawBtnMask();
		}
		
        /*
         * @method 绘按钮的背景色、目前只允许纯色按钮
         */
		public function drawBg(color:uint):void {
			_btn.graphics.clear();
			_btn.graphics.beginFill(color, 1);
			_btn.graphics.drawRoundRect(0, 0, _options._width, _options._height, _options._btnBorderRadius, _options._btnBorderRadius);
			_btn.graphics.endFill();
		}
		
        /*
         * @method 给按钮添加文本、以及改变文本样式
         */
		public function drawBtnTxt():void {
			_btnTxtFormat = new TextFormat();
			_btnTxtFormat.size = _options._fontSize;
			_btnTxtFormat.align = TextFormatAlign.CENTER;
			
			_btnTxt.defaultTextFormat = _btnTxtFormat;
			_btnTxt.text = _options._text;
			_btnTxt.textColor = _options._btnTxtBg;
			_btnTxt.width = _options._width;
			_btnTxt.height = _btnTxt.textHeight + 5;
			_btnTxt.y = (_options._height - _btnTxt.height) / 2;
		}
		
        /*
         * @method 给按钮添加事件的事件监听器
         */
		private function drawBtnMask():void {
			_btnMask.graphics.clear();
			_btnMask.graphics.beginFill(0x000000, 0);
			_btnMask.graphics.drawRoundRect(0, 0, _options._width, _options._height, _options._btnBorderRadius, _options._btnBorderRadius);
			_btnMask.graphics.endFill();
			_btnMask.buttonMode = true;
		}
		
        /*
         * @method 给按钮绑定指定的事件
         * @param {Function} click 当按钮点击后发生的事件
         * @param {Function} MouseOver 当按钮移过发生的事件
         * @param {Function} MouseOut 当按钮移出后发生的事件
         * @param {Function} MouseDown 当按键按下发生的事件
         * @param {Function} MouseUp 当按键抬起发生的事件
         */
		public function addBtnEventListener(eventObj:Object):void {
            for (var item in eventObj) {
                switch(item) {
                    case "click":
                        _btnMask.addEventListener(MouseEvent.CLICK, eventObj[item]);
                        break;
                    case "MouseOver":
                        _btnMask.addEventListener(MouseEvent.MOUSE_OVER, eventObj[item]);
                        break;
                    case "MouseOut":
                        _btnMask.addEventListener(MouseEvent.MOUSE_OUT, eventObj[item]);
                        break;
                    case "MouseDown":
                        _btnMask.addEventListener(MouseEvent.MOUSE_DOWN, eventObj[item]);
                        break;
                    case "MouseUp":
                        _btnMask.addEventListener(MouseEvent.MOUSE_UP, eventObj[item]);
                        break;
                    default:
                        break;
                }
            }
		}
	}
}
