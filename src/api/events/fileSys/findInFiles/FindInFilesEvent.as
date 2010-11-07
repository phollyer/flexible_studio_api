package api.events.fileSys.findInFiles
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FindInFilesEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const MISSING_TEXT:String = "missingText";
		public static const RESULT:String = "result";
		
		public var fileList:Array = null;
		
		public function FindInFilesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FindInFilesEvent = new FindInFilesEvent( type );
			e.fileList = fileList;
			return e;
		}
	}
}