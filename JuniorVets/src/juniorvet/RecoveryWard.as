package juniorvet
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Quad;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import juniorvet.animals.Animal;
	
	import tv.palmerama.gui.SelectableButton;
	import tv.palmerama.utils.CustomEvent;
	
	
	public class RecoveryWard extends Sprite
	{
		// timeline
		public var arrowButton:SelectableButton;
		
		// class
		public var animalList:Array;
		
		
		public function RecoveryWard()
		{
			super();
			
			animalList = [];
			arrowButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownArrowButton, false, 0, true);
		}
		
		private function onMouseDownArrowButton(event:MouseEvent):void
		{
			showNav(false);
			dispatchEvent(new CustomEvent(Constants.GOTO_RECEPTION, null, true));
		}
		
		public function showNav(show:Boolean=true):void
		{
			TweenMax.to(arrowButton, .5, {autoAlpha:show==true?1:0, ease:Quad.easeIn});
		}
		
		public function admitAnimal(animal:Animal):void
		{
			animal.positions.recoveryWard = new Point(animal.x, animal.y);
			
			var scale:Number = animal.scale;
			animal.scale = .01;
			animal.x += 80;
			animal.active = true;
			animal.currentLocation = Constants.RECOVERY_WARD;
			
			TweenMax.to(animal, .4, {scale:scale, ease:Bounce.easeOut});
			addChild(animal);
			
			animalList.push(animal);
		}
		
		private function removeFromAnimalList(animal:Animal):void
		{
			trace('animalList:', animalList.length);
			trace('\tkilling', animal.id);
			
			removeChild(animal);
			
			for (var i:int=0; i<animalList.length; ++i)
			{
				if (animalList[i] == animal)
				{
					animalList.splice(i, 1);
					break;
				}
			}
			
			trace('animalList:', animalList.length, '\n\n');
		}
		
		public function repopulateAfterCareList():void
		{
			for each (var animal:Animal in animalList)
			{
				animal.x = animal.positions.recoveryWard.x;
				animal.y = animal.positions.recoveryWard.y;
				animal.currentLocation = Constants.RECOVERY_WARD;
				animal.active = true;
				addChild(animal);
				
				if (animal.health == 100) TweenMax.to(animal, .5, {y:-animal.width, delay:.3+Math.random()*.5, ease:Bounce.easeIn, onCompleteParams:[animal], onComplete:removeFromAnimalList}); 
			}
		}
	}
}