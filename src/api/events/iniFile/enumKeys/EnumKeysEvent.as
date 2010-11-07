package api.events.iniFile.enumKeys
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class EnumKeysEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_SECTION:String = "missingSection";
		public static const RESULT:String = "result";
		
		public var keys:Array = null;
		
		public function EnumKeysEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnumKeysEvent = new EnumKeysEvent( type );
			e.keys = keys;
			return e;
		}	
	}
}