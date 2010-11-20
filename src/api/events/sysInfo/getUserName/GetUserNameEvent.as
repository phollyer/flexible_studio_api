package api.events.sysInfo.getUserName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetUserNameEvent extends SysInfoEvent
	{
		
	/**
	* The GetUserNameEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>userName</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var userName:String = null;
		
		public function GetUserNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetUserNameEvent = new GetUserNameEvent( type );
			e.userName = userName;
			return e;
		}
	}
}