package juniorvet
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Quad;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import juniorvet.animals.Animal;
	
	import com.wehaverhythm.gui.SelectableButton;
	import com.wehaverhythm.utils.CustomEvent;
	
	
	public class WaitingRoom extends Sprite
	{
		// timeline
		public var spawnArea:Sprite;
		public var arrowButton:SelectableButton;
		
		// class
		
		
		
		public function WaitingRoom()
		{
			super();
			spawnArea.visible = false;
			
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
		
		public function spawnAnimal(animal:Animal):void
		{
			animal.x = spawnArea.x + Math.random()*spawnArea.width;
			animal.y = -animal.height;
			
			var animalY:Number = spawnArea.y + Math.random()*spawnArea.height;
			animal.scale = .4 + Math.random();
			animal.scaleY = .2;
			animal.active = true;
			animal.currentLocation = Constants.WAITING_ROOM;
			
			TweenMax.to(animal, .6, {y:animalY, scaleY:animal.scale, ease:Bounce.easeOut, delay:.6});			
			addChild(animal);
		}
	}
}