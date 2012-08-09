package tv.palmerama.utils
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;	
	import flash.utils.Timer;
	import flash.events.TimerEvent;


	/**
	 *	TextTyper - types text out
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Adam Palmer
	 *	@since  26.01.2011
	 */

	public class TextTyper 
	{			
		//--------------------------------------
		//  VARIABLES
		//--------------------------------------
		
		private var _xml:XML;
		private var _text:String;
		private var _textField:TextField;
		private var _tempTextField:TextField;
		private var _maxWidth:int;
		private var _counter:int;
		private var _lastSpace:int;
		private var _timer:Timer;
		
				
		public function TextTyper():void
		{
			
		}
		
		//--------------------------------------
		//  PRIVATE METHODS
		//--------------------------------------	
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public function typeText($xml:XML, $textField:TextField, $tempTextField:TextField, $maxWidth:int, $interval:int):void
		{
			_text = $xml.p;
			_textField = $textField;
			_tempTextField = $tempTextField;
			_maxWidth = $maxWidth;
			_counter = 0;
			_lastSpace = 0;
			
			// start loop
			_timer = new Timer($interval);
			_timer.addEventListener(TimerEvent.TIMER, _onTimerTick);
			_timer.start();
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		private function _onTimerTick(e:TimerEvent):void
		{
			// get next character
			var c:String = _text.substring(_counter, _counter+1);
			
			// find whole word
			var word:String = c;
			
			for (var i:int=_counter+1; i < _text.length; i++) 
			{
				word = _text.substring(_lastSpace, i);
				if (word.indexOf(" ") > -1) 
				{
					_lastSpace = i;
					break;
				}
			}
			
			// check word will fit on line
			trace(word)
			
			// type it out
			_textField.appendText(c);
			
			// advance
			++_counter;
		}
		
		//--------------------------------------
		//  GETTERS & SETTERS
		//--------------------------------------

	}
}