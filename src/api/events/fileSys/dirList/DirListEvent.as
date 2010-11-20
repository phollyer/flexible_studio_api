package api.events.fileSys.dirList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DirListEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var directoryList:Array = null;
		
		public function DirListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DirListEvent = new DirListEvent( type );
			e.directoryList = directoryList;
			return e;
		}
	}
}