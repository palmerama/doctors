package juniorvet.animals
{
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import juniorvet.Constants;
	
	import tv.palmerama.utils.CustomEvent;
	
	
	public class Animal extends MovieClip
	{		
		// timeline
		public var idField:TextField;
		public var circle:Sprite;
		
		// class
		public var id:int;
		private var zPos:int;
		private var scaling:Number;
		
		private var location:String;
		public var positions:Object = {};
		public var health:int;
		
		
		public function Animal()
		{
			super();
			
			stop();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			health = int(30 + Math.random()*60);
			mouseChildren = false;
			// active = true;
		}
		
		public function updateHealth(value:int):int
		{
			health = Math.min(health+value, 100);
			return health;
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			if (currentLocation == Constants.WAITING_ROOM) dispatchEvent(new CustomEvent(Constants.GOTO_DIAGNOSIS, {animal:this}, true));
			if (currentLocation == Constants.RECOVERY_WARD) dispatchEvent(new CustomEvent(Constants.GOTO_CARE_LIST, {animal:this}, true));
			if (currentLocation == Constants.CARE_LIST) dispatchEvent(new CustomEvent(Constants.USE_ANIMAL_IN_CARE_LIST, {animal:this}, true));		
		}
		
		private function onMouseOver(event:MouseEvent):void
		{
			// zPos = parent.getChildIndex(this);
			parent.setChildIndex(this, parent.numChildren-1);
			gotoAndStop('over');
		}
		
		private function onMouseOut(event:MouseEvent):void
		{
			// parent.setChildIndex(this, zPos);
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
		
		public function set currentLocation(value:String):void
		{
			location = value;
		}
		
		public function get currentLocation():String
		{
			return location;
		}
		
		public function set active(value:Boolean):void
		{
			buttonMode = value;
			gotoAndStop('up');
			
			if (buttonMode)
			{
				addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
				addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
				addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 0, true);
			} else {
				removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
				removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
				removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			}
			
		}
		
		public function get active():Boolean
		{
			return buttonMode;
		}
		
	}
}