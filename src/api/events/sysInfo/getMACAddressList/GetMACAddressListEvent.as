package api.events.sysInfo.getMACAddressList
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetMACAddressListEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var addresses:Array = null;
		
		public function GetMACAddressListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetMACAddressListEvent = new GetMACAddressListEvent( type );
			e.addresses = addresses;
			return e;
		}
	}
}