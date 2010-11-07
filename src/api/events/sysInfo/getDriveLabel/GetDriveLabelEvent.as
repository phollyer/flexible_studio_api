package api.events.sysInfo.getDriveLabel
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetDriveLabelEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DRIVE_LETTER:String = "missingDriveLetter";
		public static const RESULT:String = "result";
		
		public var driveLabel:String = null;
		
		public function GetDriveLabelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDriveLabelEvent = new GetDriveLabelEvent( type );
			e.driveLabel = driveLabel;
			return e;
		}
	}
}