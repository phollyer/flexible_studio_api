package api.events.sysInfo.isUserAnAdmin
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class IsUserAnAdminEvent extends SysInfoEvent
	{
		/**
	* The IsUserAnAdminEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>isAdmin</td><td>false</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var isAdmin:Boolean = false;
		
		public function IsUserAnAdminEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsUserAnAdminEvent = new IsUserAnAdminEvent( type );
			e.isAdmin = isAdmin;
			return e;
		}
	}
}