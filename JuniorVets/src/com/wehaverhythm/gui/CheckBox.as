package com.wehaverhythm.gui 
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;


	/**
	 *	CheckBox class
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Adam Palmer
	 *	@since  12.10.2008
	 */

	public class CheckBox extends MovieClip 
	{
		protected var currentState:int = 0;
		

		public function CheckBox():void
		{
			gotoAndStop("unchecked");
			
			buttonMode = true;
			mouseChildren = false;
			
			addEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			addEventListener(MouseEvent.ROLL_OUT, onRollOut);
			addEventListener(MouseEvent.MOUSE_DOWN, onClick);
		}

		protected function onRollOver(e:MouseEvent):void
		{
			gotoAndStop("over");
		}
		
		protected function onRollOut(e:MouseEvent):void
		{
			if (currentState == 0) gotoAndStop("unchecked");
			else gotoAndStop("checked");
			addEventListener(MouseEvent.MOUSE_OVER, onRollOver);
		}
		
		protected function onClick(e:MouseEvent):void
		{
			if (currentState == 0)
			{
				currentState = 1;
				gotoAndStop("checked");
			} else {
				currentState = 0;
				gotoAndStop("unchecked");
			}
			
			removeEventListener(MouseEvent.MOUSE_OVER, onRollOver);
			dispatchEvent(new Event('checkbox clicked', true));
		}		

		public function get state():int
		{
			return currentState;
		}

		public override function toString():String
		{
			return "CheckBox";
		};
	}
}