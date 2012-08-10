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
		public var spawnAnimalButton:SelectableButton;
		
		
		public function Reception()
		{
			super();
			initButtons();
		}						
		
		public function showNav(show:Boolean=true):void
		{
			recoveryWardButton.visible = waitingRoomButton.visible = show;
		}
		
		private function initButtons():void
		{
			waitingRoomButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownWaitingRoomButton, false, 0, true);
			recoveryWardButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownRecoveryWardButton, false, 0, true);
			spawnAnimalButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownSpawnAnimalButton, false, 0, true);
		}
		
		private function onMouseDownSpawnAnimalButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(CustomEvents.SPAWN_RANDOM_ANIMAL, null, true));
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