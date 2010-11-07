package api.events.fileSys.driveList
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DriveListEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var drives:Array = null;
		
		public function DriveListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DriveListEvent = new DriveListEvent( type );
			e.drives = drives;
			return e;
		}
	}
}