package api.events.sysInfo.getComputerName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetComputerNameEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var computerName:String = null;
		
		public function GetComputerNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetComputerNameEvent = new GetComputerNameEvent( type );
			e.computerName;
			return e;
		}
	}
}