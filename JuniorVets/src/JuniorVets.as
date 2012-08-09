package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	[SWF(frameRate="30", backgroundColor="#FFFFFF", width="944", height="577")]
	public class JuniorVets extends Sprite
	{
		private var mainMenu:MainMenuDisplay;
		
		
		public function JuniorVets()
		{
			super();
			init();
		}
		
		private function init():void
		{
			scrollRect = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
			
			mainMenu = new MainMenuDisplay();			
			addChild(mainMenu);
		}
	}
}