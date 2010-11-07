package api.events.fileSys.driveType
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DriveTypeEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DRIVE:String = "missingDrive";
		public static const RESULT:String = "result";
		
		public var typeOfDrive:String = null;
		
		public function DriveTypeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DriveTypeEvent = new DriveTypeEvent( type );
			e.typeOfDrive = typeOfDrive;
			return e;
		}
	}
}