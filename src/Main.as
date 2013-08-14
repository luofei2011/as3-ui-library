package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import ui.Button;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			var test:Button = new Button({
//				_text: "我擦传过来了",
//				_fontSize: 20
			});
			
			test.x = test.y = 0;
			test.addBtnEventListener({
				click: function(e:MouseEvent):void {
					trace("hello world!");
				}
			});
			
			addChild(test);
		}
	}
}