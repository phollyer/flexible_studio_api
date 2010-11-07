package api.events.fileSys.fileSize
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class FileSizeEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var size:Number = -1;
		
		public function FileSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FileSizeEvent = new FileSizeEvent( type );
			e.size = size;
			return e;
		}
	}
}