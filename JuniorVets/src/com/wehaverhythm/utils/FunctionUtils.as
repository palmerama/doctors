package com.wehaverhythm.utils
{
	import flash.utils.describeType;

	public class FunctionUtils
	{
		public static function getFunctionName(f:Function, obj:Object):String
		{
			var fn:String = "no name";
			var type:XML = describeType(obj);    
			// trace(type);
			for each (var node:XML in type..method)
			{
				       if (obj[node.@name] == f) {
					           fn = node.@name;
					           break;
				       }
			   }
			   return fn;
		}
	}
}