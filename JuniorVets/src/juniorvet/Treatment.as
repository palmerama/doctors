package juniorvet
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import com.wehaverhythm.gui.SelectableButton;
	import com.wehaverhythm.utils.CustomEvent;
	import flash.events.Event;
	
	
	public class Treatment extends Sprite
	{
		// timeline
		public var yesButton:SelectableButton;
		
		
		public function Treatment()
		{
			super();			
			
			visible = false;
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			yesButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownYesButton, false, 0, true);
		}
		
		private function onMouseDownYesButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(Constants.GOTO_LOOP_SCORE, null, true));
		}
	}
}