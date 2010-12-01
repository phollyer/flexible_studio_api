package api.events.sysInfo.getMACAddressList
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetMACAddressListEvent extends SysInfoEvent
	{
		/**
	* The GetMACAddressListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>addresses</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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