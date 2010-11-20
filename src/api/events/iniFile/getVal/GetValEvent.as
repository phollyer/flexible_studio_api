package api.events.iniFile.getVal
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class GetValEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_KEY:String = "missingKey";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_SECTION:String = "missingSection";
		public static const RESULT:String = "result";
		
		public var keyValue:String = null;
		
		public function GetValEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetValEvent = new GetValEvent( type );
			e.keyValue = keyValue;
			return e;
		}
	}
}