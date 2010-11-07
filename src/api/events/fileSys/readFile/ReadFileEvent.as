package api.events.fileSys.readFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ReadFileEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function ReadFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadFileEvent = new ReadFileEvent( type );
			e.data = data;
			return e;
		}
	}
}