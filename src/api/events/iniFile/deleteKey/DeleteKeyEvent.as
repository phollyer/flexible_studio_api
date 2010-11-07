package api.events.iniFile.deleteKey
{
	import flash.events.Event;
	
	import api.events.iniFile.IniFileEvent;

	public class DeleteKeyEvent extends IniFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_KEY:String = "missingKey";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_SECTION:String = "missingSection";
		
		public function DeleteKeyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteKeyEvent = new DeleteKeyEvent( type );
			return e;
		}
	}
}