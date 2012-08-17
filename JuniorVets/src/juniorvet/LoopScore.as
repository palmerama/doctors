package juniorvet
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import tv.palmerama.gui.SelectableButton;
	import tv.palmerama.utils.CustomEvent;
	
	
	public class LoopScore extends Sprite
	{
		// timeline
		public var okButton:SelectableButton;
		public var multiplier:TextField;
		public var treatment:TextField;
		public var total:TextField;
		
		
		public function LoopScore()
		{
			super();			
			
			visible = false;
			alpha = 0;
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			okButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownOKButton, false, 0, true);
		}
		
		private function onMouseDownOKButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(Constants.GOTO_RECOVERY_WARD_WITH_ANIMAL));
		}
		
		public function useScores(scores:Object, totalScore:int):void
		{
			multiplier.text = String(scores.diagnosis);
			treatment.text = String(scores.treatment);
			total.text = String(totalScore);
		}
	}
}