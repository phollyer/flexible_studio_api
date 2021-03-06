package api.events.http.getDefaultProxyPort
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultProxyPortEvent extends HttpEvent
	{
		
	/**
	* The GetDefaultProxyPortEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var portNumber:Number = -1;
		
		public function GetDefaultProxyPortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultProxyPortEvent = new GetDefaultProxyPortEvent( type );
			e.portNumber = portNumber;
			return e;
		}
	}
}