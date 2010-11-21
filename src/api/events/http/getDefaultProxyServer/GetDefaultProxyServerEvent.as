package api.events.http.getDefaultProxyServer
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultProxyServerEvent extends HttpEvent
	{
		/**
	* The GetDefaultProxyServerEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>server</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var server:String = null;
		
		public function GetDefaultProxyServerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultProxyServerEvent = new GetDefaultProxyServerEvent( type );
			e.server = server;
			return e;
		}
	}
}