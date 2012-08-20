package juniorvet
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import juniorvet.animals.Animal;
	
	import com.wehaverhythm.gui.SelectableButton;
	import com.wehaverhythm.utils.CustomEvent;
	
	
	public class CareList extends Sprite
	{
		// timeline
		public var arrowButton:SelectableButton;
		public var careButton:SelectableButton;
		public var health:TextField;
		
		// class
		private var animalsHolder:Sprite;
		private var currentAnimal:Animal;
		
		
		public function CareList()
		{
			super();
			
			visible = false;
			alpha = 0;
			
			arrowButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownArrowButton, false, 0, true);
			careButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownCareButton, false, 0, true);
			
			animalsHolder = new Sprite();
			animalsHolder.x = 40;
			animalsHolder.y = 490;
			animalsHolder.scaleX = animalsHolder.scaleY = .6;
			animalsHolder.addEventListener(Constants.USE_ANIMAL_IN_CARE_LIST, onUseAnimal, false, 0, true);
			addChild(animalsHolder);
		}
		
		private function onMouseDownCareButton(event:MouseEvent):void
		{
			health.text = currentAnimal.updateHealth(10) + '%';
		}
		
		public function populate(animalList:Array, clickedAnimal:Animal):void
		{
			while (animalsHolder.numChildren > 0) { animalsHolder.removeChildAt(0); }
			currentAnimal = null;
			
			for each (var animal:Animal in animalList)
			{
				animal.x = animalsHolder.width*(1/animalsHolder.scaleX) + animal.width/2 + (animalsHolder.numChildren > 0 ? 40 : 0);
				animal.y = 0;
				animal.active = true;
				animal.positions.careList = new Point(animal.x, animal.y);
				animal.currentLocation = Constants.CARE_LIST;
				animalsHolder.addChild(animal);
			}
			
			for each (animal in animalList)
			{
				if (animal == clickedAnimal) useAnimal(animal);
			}
		}
		
		private function onUseAnimal(event:CustomEvent):void
		{
			useAnimal(event.params.animal);
		}
	
		private function useAnimal(animal:Animal):void
		{
			if (currentAnimal)
			{
				currentAnimal.active = true;
				currentAnimal.x = currentAnimal.positions.careList.x;
				currentAnimal.y = currentAnimal.positions.careList.y;
				animalsHolder.addChild(currentAnimal);
			}
			
			animal.active = false;
			animal.x = 280;
			animal.y = 200;
			currentAnimal = animal;
			addChild(animal);
			
			health.text = animal.health + '%';
		}
		
		private function onMouseDownArrowButton(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(Constants.GOTO_RECOVERY_WARD, null, true));
		}
		
	}
}