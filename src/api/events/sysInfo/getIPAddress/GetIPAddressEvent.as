package api.events.sysInfo.getIPAddress
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetIPAddressEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var ipAddress:String = null;
		
		public function GetIPAddressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetIPAddressEvent = new GetIPAddressEvent( type );
			e.ipAddress = ipAddress;
			return e;
		}
	}
}