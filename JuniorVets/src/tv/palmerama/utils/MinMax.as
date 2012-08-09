package tv.palmerama.utils
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	
	/**
	 *	Simple class for Min Max values
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Adam Palmer
	 *	@since  06.08.2009
	 */
	
	public class MinMax
	{			
		public var min:Number;
		public var max:Number;
		
		
		public function MinMax(min:Number, max:Number):void
		{
			this.min = min;
			this.max = max;
		}
		
		public function getEvenlySpacedArray(elements:int, decimelPlaces:int=2):Array
		{
			var spacing:Number = (max - min) / (elements-1);			
			var spacedArray:Array = [];
			
			for (var i:int=0; i<elements; i++)
			{
				var nextStep:Number = min + i*spacing;				
				if (decimelPlaces > 0) nextStep = Number(nextStep.toFixed(decimelPlaces));
				else nextStep = Math.ceil(nextStep);
				
				spacedArray.push(nextStep);
			}
			
			return spacedArray;
		}
		
		public function getUnEvenlySpacedArray(elements:int, decimelPlaces:int=2, percentageSpread:Number=.9):Array
		{
			var unevenlySpacedArray:Array = getEvenlySpacedArray(elements, decimelPlaces);
			var spread:Number = unevenlySpacedArray[1]*percentageSpread;
			
			for (var i:int=1; i<elements-1; i++)
			{
				var range:MinMax = new MinMax(unevenlySpacedArray[i]-spread/2, unevenlySpacedArray[i]+spread/2);
				var nextStep:Number = range.random;
				
				if (decimelPlaces > 0) nextStep = Number(nextStep.toFixed(decimelPlaces));
				else nextStep = Math.ceil(nextStep);
				
				unevenlySpacedArray[i] = nextStep;
			}
			
			unevenlySpacedArray.sort(Array.NUMERIC);			
			return unevenlySpacedArray;			
		}
		
		public function get random():Number
		{
			return min + Math.random()*(max - min);			
		}
		
		public static function randomBetween(tempMin:Number, tempMax:Number):Number
		{
			return tempMin + Math.random()*(tempMax - tempMin);		
		}
	}
}