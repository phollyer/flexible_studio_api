package api.events.fileSys.writeToFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const MISSING_PATH:String = "missingPath";
		
		public function WriteToFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteToFileEvent = new WriteToFileEvent( type );
			return e;
		}
	}
}