package api.events.iniFile.setVal
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class SetValEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_KEY:String = "missingKey";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_SECTION:String = "missingSection";
		public static const MISSING_VALUE:String = "missingValue";
		
		public function SetValEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetValEvent = new SetValEvent( type );
			return e;
		}
	}
}