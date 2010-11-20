package api.events.fileSys.fileList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileListEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var files:Array = null;
		
		public function FileListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileListEvent = new FileListEvent( type );
			e.files = files;
			return e;
		}
	}
}