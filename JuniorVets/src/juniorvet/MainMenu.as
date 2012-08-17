package juniorvet
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Quad;
	import com.greensock.easing.Sine;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import juniorvet.animals.Animal;
	import juniorvet.animals.AnimalManager;
	
	import tv.palmerama.utils.CustomEvent;
	
	
	public class MainMenu extends Sprite
	{
		public var animalManager:AnimalManager;
		
		// timeline
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
			onGotoReception(null);
			
			reception.addEventListener(Constants.GOTO_WAITING_ROOM, onGotoWaitingRoom, false, 0, true);
			reception.addEventListener(Constants.GOTO_RECOVERY_WARD, onGotoRecoveryWard, false, 0, true);
			reception.addEventListener(Constants.SPAWN_RANDOM_ANIMAL, onSpawnRandomAnimal, false, 0, true);
			
			waitingRoom.addEventListener(Constants.GOTO_RECEPTION, onGotoReception, false, 0, true);
			recoveryWard.addEventListener(Constants.GOTO_RECEPTION, onGotoReception, false, 0, true);
		}
		
		private function onSpawnRandomAnimal(event:Event):void
		{
			waitingRoom.spawnAnimal(animalManager.getRandomAnimal());
			onGotoWaitingRoom(null);
		}
		
		private function onGotoReception(event:Event):void
		{
			waitingRoom.showNav(false);
			recoveryWard.showNav(false);
			
			TweenMax.to(this, .5, {x:stage.stageWidth/2, ease:Sine.easeOut, onComplete:function():void
				{
					reception.showNav();
				}
			});
		}
		
		private function onGotoWaitingRoom(event:Event):void
		{
			TweenMax.to(this, .5, {x:1194, ease:Sine.easeOut, onComplete:function():void
				{
					waitingRoom.showNav();
				}
			});
		}
		
		private function onGotoRecoveryWard(event:Event):void
		{
			TweenMax.to(this, .5, {x:-250, ease:Sine.easeOut, onComplete:function():void
				{
					recoveryWard.showNav();
				}
			});
		}
		
		public function gotoRecoveryWardWithAnimal(animal:Animal):void
		{
			TweenMax.to(this, .5, {x:-250, ease:Sine.easeOut, onComplete:function():void
				{
					recoveryWard.showNav();
					recoveryWard.admitAnimal(animal);
				}
			});
		}
	}
}