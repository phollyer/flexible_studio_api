package api.events.fileSys.fileExists
{
	import flash.events.Event;
	import api.events.fileSys.FileSysEvent;

	public class FileExistsEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var exists:Boolean = false;
		
		public function FileExistsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileExistsEvent = new FileExistsEvent( type );
			e.exists = exists;
			return e;
		}
	}
}