package api.events.fileSys.getFolderSize
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class GetFolderSizeEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var bytes:Number = -1;
		public var gigabytes:Number = -1;
		public var kilobytes:Number = -1;
		public var megabytes:Number = -1;
		
		public function GetFolderSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFolderSizeEvent = new GetFolderSizeEvent( type );
			e.bytes = bytes;
			e.gigabytes = gigabytes;
			e.kilobytes = kilobytes;
			e.megabytes = megabytes;
			return e;
		}
	}
}