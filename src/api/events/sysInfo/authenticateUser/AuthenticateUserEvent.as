package api.events.sysInfo.authenticateUser
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class AuthenticateUserEvent extends SysInfoEvent
	{
		/**
	* The AuthenticateUserEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>verified</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var verified:Boolean = false;
		
		public function AuthenticateUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AuthenticateUserEvent = new AuthenticateUserEvent( type );
			e.verified = verified;
			return e;
		}
	}
}