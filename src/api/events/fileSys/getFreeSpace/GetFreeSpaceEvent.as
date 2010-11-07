package api.events.fileSys.getFreeSpace
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class GetFreeSpaceEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var kilobytes:Number = -1;
		
		public function GetFreeSpaceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFreeSpaceEvent = new GetFreeSpaceEvent( type );
			e.kilobytes = kilobytes;
			return e;
		}
	}
}