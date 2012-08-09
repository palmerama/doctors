package juniorvet
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Sine;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	
	public class MainMenu extends Sprite
	{
		public var waitingRoom:WaitingRoom;
		public var reception:Reception;
		public var recoveryWard:RecoveryWard;
		
		
		public function MainMenu()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			x = stage.stageWidth/2;
			
			reception.addEventListener(CustomEvents.GOTO_WAITING_ROOM, onGotoWaitingRoom, false, 0, true);
			reception.addEventListener(CustomEvents.GOTO_RECOVERY_WARD, onGotoRecoveryWard, false, 0, true);			
		}
		
		private function onGotoWaitingRoom(event:Event):void
		{
			TweenMax.to(this, .5, {x:1194, ease:Sine.easeOut});
		}
		
		private function onGotoRecoveryWard(event:Event):void
		{
			TweenMax.to(this, .5, {x:-250, ease:Sine.easeOut});
		}
	}
}