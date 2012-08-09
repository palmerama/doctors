package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	[SWF(frameRate="30", backgroundColor="#FFFFFF", width="944", height="577")]
	public class JuniorVets extends Sprite
	{
		private var mainMenu:MainMenuDisplay;
		
		
		public function JuniorVets()
		{
		
		}
		
		private function init():void
		{
			mainMenu = new MainMenuDisplay();
			addChild(mainMenu);
		}
	}
}