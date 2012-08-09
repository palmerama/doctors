package juniorvet
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import tv.palmerama.gui.SelectableButton;
	import tv.palmerama.utils.CustomEvent;
	
	
	public class Reception extends Sprite
	{
		public var waitingRoomButton:SelectableButton;
		public var recoveryWardButton:SelectableButton;
		
		
		public function Reception()
		{
			super();
			initButtons();
		}						
		
		private function initButtons():void
		{
			waitingRoomButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownWaitingRoomButton, false, 0, true);
			recoveryWardButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownRecoveryWardButton, false, 0, true);
		}
		
		private function onMouseDownWaitingRoomButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(CustomEvents.GOTO_WAITING_ROOM, null, true));
		}
		
		private function onMouseDownRecoveryWardButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(CustomEvents.GOTO_RECOVERY_WARD, null, true));
		}
	}
}