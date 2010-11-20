package api.events.fileSys.fileVer
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileVerEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var version:String = null;
		
		public function FileVerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileVerEvent = new FileVerEvent( type );
			e.version = version;
			return e;
		}
	}
}