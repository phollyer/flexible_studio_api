package api.events.sysInfo.getIPAddress
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetIPAddressEvent extends SysInfoEvent
	{
		/**
	* The GetIPAddressEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>ipAddress</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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