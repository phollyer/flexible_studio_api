package api.events.fileSys.findFiles
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FindFilesEvent extends FileSysEvent
	{		
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";		
		
		public var fileList:Array = null;
		
		public function FindFilesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : FindFilesEvent = new FindFilesEvent(type);
			e.fileList = fileList;
			return e;
		}		
	}
}