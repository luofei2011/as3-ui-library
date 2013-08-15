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
        private var btn:Sprite;
        private var btnMask:Sprite;

        // 按钮文本
        private var btnTxt:TextField;
        private var btnTxtFormat:TextFormat;

        // 参数列表
        private var options:Object = {};

        // 默认参数列表
        private var default:Object = {
            width: 60,
            height: 30,
            text: "发送",
            bgColor: 0xF49909,
            overColor: 0xFDAA24,
            clickDownColor: 0xFDAA24,
            txtColor: 0xFFFFFF,
            txtOverColor: 0xFFFFFF,
            txtClickDownColor: 0xFFFFFF,
            txtFontSize: 12,
			
			border: 0,
			borderColor: 0xFFFFFF,
			borderRadius: 0
        };

		public function Button(options:Object)
		{
			super();

            options = extend(options, default);

			console(options);
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
            for (var item in sor) {
                if (!des[item]) {
                    des[item] = sor[item];
                }
            }

            return des;
        }
		
        /*
         * @method 确定舞台上需要添加的对象
         */
		private function addChildren():void {
			btn = new Sprite();
			btnMask = new Sprite();
			btnTxt = new TextField();
			
			btn.addChild(btnTxt);
			btn.addChild(btnMask);
			
			addChild(btn);
		}
		
        /*
         * @method 实现舞台上需要添加的对象
         */
		private function draw():void {
			drawBg(options.bgColor);
			drawBtnTxt();
			drawBtnMask();
		}
		
        /*
         * @method 绘按钮的背景色、目前只允许纯色按钮
         */
		private function drawBg(color:uint):void {
			btn.graphics.clear();
			btn.graphics.beginFill(color, 1);
			btn.graphics.drawRoundRect(0, 0, options.width, options.height,
                options.borderRadius, options.borderRadius);
			btn.graphics.endFill();
		}
		
        /*
         * @method 给按钮添加文本、以及改变文本样式
         */
		private function drawBtnTxt():void {
			btnTxtFormat = new TextFormat();
			btnTxtFormat.size = options.txtFontSize;
			btnTxtFormat.align = TextFormatAlign.CENTER;
			
			btnTxt.defaultTextFormat = btnTxtFormat;
			btnTxt.text = options.text;
			btnTxt.textColor = options.txtColor;
			btnTxt.width = options.width;
			btnTxt.height = btnTxt.textHeight + 5;
			btnTxt.y = (options.height - btnTxt.height) / 2;
		}
		
        /*
         * @method 给按钮添加事件的事件监听器
         */
		private function drawBtnMask():void {
			btnMask.graphics.clear();
			btnMask.graphics.beginFill(0x000000, 0);
			btnMask.graphics.drawRoundRect(0, 0, options.width, options.height,
                options.borderRadius, options.borderRadius);
			btnMask.graphics.endFill();
			btnMask.buttonMode = true;
		}

        /*
         * @method 插件内置事件监听器
         * */
        private function innerEventListener():void {
            if (options.bgColor != options.overColor) {
                btnMask.addEventListener(MouseEvent.MOUSE_OVER, function():void {
                    drawBg(options.overColor);
                    btnTxt.textColor = options.txtOverColor;
                });

                btnMask.addEventListener(MouseEvent.MOUSE_UP, function():void {
                    drawBg(options.bgColor);
                    btnTxt.textColor = options.txtColor;
                });
            }
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
                    case "Click":
                        btnMask.addEventListener(MouseEvent.CLICK, eventObj[item]);
                        break;
                    case "MouseOver":
                        btnMask.addEventListener(MouseEvent.MOUSE_OVER, eventObj[item]);
                        break;
                    case "MouseOut":
                        btnMask.addEventListener(MouseEvent.MOUSE_OUT, eventObj[item]);
                        break;
                    case "MouseDown":
                        btnMask.addEventListener(MouseEvent.MOUSE_DOWN, eventObj[item]);
                        break;
                    case "MouseUp":
                        btnMask.addEventListener(MouseEvent.MOUS_EUP, eventObj[item]);
                        break;
                    default:
                        break;
                }
            }
		}
	}
}
