package juniorvet.animals
{
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import juniorvet.CustomEvents;
	
	import tv.palmerama.utils.CustomEvent;
	
	
	public class Animal extends MovieClip
	{		
		// timeline
		public var idField:TextField;
		public var circle:Sprite;
		
		// class
		private var id:int;
		private var zPos:int;
		private var scaling:Number;
		
		
		
		public function Animal()
		{
			super();
			
			stop();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			mouseChildren = false;
			buttonMode = true;
			
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);
			
			zPos = parent.getChildIndex(this);
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			dispatchEvent(new CustomEvent(CustomEvents.GOTO_DIAGNOSIS, {animal:this}, true));
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			parent.setChildIndex(this, parent.numChildren-1);
			gotoAndStop('over');
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			parent.setChildIndex(this, zPos);
			gotoAndStop('up');
		}
		
		public function set scale(value:Number):void
		{
			scaling = scaleX = scaleY = value;
		}
		
		public function get scale():Number
		{
			return scaling;
		}
		
		public function set animalId(value:int):void
		{
			id = value;
			idField.text = String(id);
		}
		
	}
}