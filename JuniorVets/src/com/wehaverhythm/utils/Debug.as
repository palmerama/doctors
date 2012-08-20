package com.wehaverhythm.utils
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	
	
	public class Debug
	{
		public function Debug()
		{
			
		}
		
		/**
		 * Traces out the displayList for this object
		 */
		public static function showDisplayList($displayObject:*):void
		{
			trace("");
			trace("**** DISPLAY LIST FOR: " + $displayObject + " ****\n");
			
			for (var i:int=$displayObject.numChildren-1; i >= 0; i--)
			{
				var kid:DisplayObject = $displayObject.getChildAt(i);
				trace(i + ": " + kid + " : " + kid.name);
			}
			
			trace("\n**********");
			trace("");
		}
		
		/**
		 * Traces an object (Array, whatever) and iterates through all its children.
		 */
		public static function deepTrace($obj:*, $name:String="unnamed object", $level:int=0):String
		{
			var msg:String = "**** DEEP TRACE FOR: " + $name + " ****";
			
			msg += nextDeepTrace($obj, $level);
			
			msg += "**********\n";
			
			return msg;
		}
		
		public static function nextDeepTrace($obj:*, $level:int=0):String
		{
			var msg:String;
			
			var tabs:String = "";			
			for (var i:int = 0; i < $level; i++) 
			{
				tabs += "\t";
			}
			
			for (var prop:String in $obj)
			{
				msg += tabs + "[" + prop + "] -> " + $obj[prop] + "\n";
				nextDeepTrace($obj[prop], $level+1);
			}
			
			return msg;
		}
		
		/**
		 * Returns the function that called your function.
		 */
		public static function getCallee(calltStackIndex:int=3):String
		{
			var stackLine:String = new Error().getStackTrace().split( "\n" , calltStackIndex + 1 )[calltStackIndex];
			var functionName:String = stackLine.match( /\w+\(\)/ )[0];
			var className:String = stackLine.match( /(?<=\/)\w+?(?=.as:)/ )[0];
			var lineNumber:String = stackLine.match( /(?<=:)\d+/ )[0];
			return className + "." + functionName + ", line " + lineNumber;
		}
		
		/**
		 * Logs to the js console when available; traces if not.
		 * NB. some types trace object structures!
		 */
		public static function log(obj:*, type:String="log"):void // log, info, warn, debug, error
		{			
			if (ExternalInterface.available) ExternalInterface.call("console."+type, obj);
			else trace(obj);
		}
	}
}