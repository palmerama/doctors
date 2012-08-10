package juniorvet
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Quad;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import juniorvet.animals.Animal;
	
	import tv.palmerama.gui.SelectableButton;
	import tv.palmerama.utils.CustomEvent;
	
	
	public class RecoveryWard extends Sprite
	{
		// timeline
		public var arrowButton:SelectableButton;
		
		
		public function RecoveryWard()
		{
			super();
			arrowButton.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownArrowButton, false, 0, true);
		}
		
		private function onMouseDownArrowButton(event:MouseEvent):void
		{
			showNav(false);
			dispatchEvent(new CustomEvent(CustomEvents.GOTO_RECEPTION, null, true));
		}
		
		public function showNav(show:Boolean=true):void
		{
			TweenMax.to(arrowButton, .5, {autoAlpha:show==true?1:0, ease:Quad.easeIn});
		}
		
		public function admitAnimal(animal:Animal):void
		{
			var scale:Number = animal.scale;
			animal.scale = .01;
			animal.x += 80;
			
			TweenMax.to(animal, .4, {scale:scale, ease:Bounce.easeOut});
			addChild(animal);
		}
	}
}