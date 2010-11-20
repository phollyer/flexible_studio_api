package api.events.sysInfo.getDomainName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetDomainNameEvent extends SysInfoEvent
	{
		/**
	* The GetDomainNameEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>domainName</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var domainName:String = null;
		
		public function GetDomainNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDomainNameEvent = new GetDomainNameEvent( type );
			e.domainName = domainName;
			return e;
		}
	}
}