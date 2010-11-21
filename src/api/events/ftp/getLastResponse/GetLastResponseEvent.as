package api.events.ftp.getLastResponse
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetLastResponseEvent extends FtpEvent
	{
		/**
	* The GetLastResponseEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>serverResponse</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var serverResponse:String = null;
		
		public function GetLastResponseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetLastResponseEvent = new GetLastResponseEvent( type );
			e.serverResponse = serverResponse;
			return e;
		}
	}
}