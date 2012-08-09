package tv.palmerama.gui
{	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import tv.palmerama.utils.Debug;
	
	
	/**
	 *	includes an id for menus/lists
	 *
	 *	@author Adam Palmer
	 *	@since  07.03.2008
	 */
	
	public class SelectableButton extends MovieClip
	{
		public var id:int;
		public var identifier:String;
		public var state:String;
		public var selected:Boolean;
		
		
		public function SelectableButton()
		{
			// set up
			buttonMode = true;
			tabChildren = false;
			mouseChildren = false;
			selected = false;
			
			mouseUpHandler(null);
			
			// behave like a button
			addButtonFunctionality();
		}
		
		public function addButtonFunctionality():void
		{
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, clickHandler, false, 0, true); 
			addEventListener(MouseEvent.ROLL_OVER, rollOverHandler, false, 0, true); 
			addEventListener(MouseEvent.MOUSE_OUT, rollOutHandler, false, 0, true); 
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler, false, 0, true); 
			//addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);
			
			mouseUpHandler(null);
		}
		
		public function removeButtonFunctionality():void
		{
			buttonMode = false;
			removeEventListener(MouseEvent.CLICK, clickHandler);  
			removeEventListener(MouseEvent.ROLL_OVER, rollOverHandler);    
			removeEventListener(MouseEvent.MOUSE_OUT, rollOutHandler); 
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler); 
			//removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler); 
		}
		
		public function enable():void
		{
			enabled = true;
			mouseEnabled = true;
		}

		public function disable():void
		{
			enabled = false;
			mouseEnabled = false;
		}
		
		public function select():void
		{
			removeButtonFunctionality();
			gotoAndStop('selected');
			selected = true;
		}
		
		public function deselect():void
		{
			addButtonFunctionality();
			mouseUpHandler(null);
			selected = false;
		}
	
		protected function clickHandler(e:MouseEvent):void
		{
		}
		
		protected function mouseDownHandler(e:MouseEvent):void
		{
			gotoAndStop("down");
		}
		
		protected function mouseUpHandler(e:MouseEvent):void
		{
			gotoAndStop("up");
		}
		
		protected function rollOutHandler(e:MouseEvent):void
		{
			mouseUpHandler(null);
		}
		
		protected function rollOverHandler(e:MouseEvent):void
		{
			gotoAndStop("over");			
		}
	
		public override function toString():String
		{
			return "SelectableButton";
		}
	}
}