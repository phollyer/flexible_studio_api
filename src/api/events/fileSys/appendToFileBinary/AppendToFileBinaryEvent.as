package api.events.fileSys.appendToFileBinary
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class AppendToFileBinaryEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const MISSING_PATH:String = "missingPath";
		
		public function AppendToFileBinaryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppendToFileBinaryEvent = new AppendToFileBinaryEvent( type );
			return e;
		}
	}
}