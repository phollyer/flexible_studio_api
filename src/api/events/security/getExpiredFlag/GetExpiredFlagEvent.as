package api.events.security.getExpiredFlag
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class GetExpiredFlagEvent extends SecurityEvent
	{
		
	/**
	* The GetExpiredFlagEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>expired</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var expired:Boolean = false;
		
		public function GetExpiredFlagEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetExpiredFlagEvent = new GetExpiredFlagEvent( type );
			e.expired = expired;
			return e;
		}
	}
}