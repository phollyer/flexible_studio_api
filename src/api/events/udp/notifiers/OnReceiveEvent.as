package api.events.udp.notifiers
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class OnReceiveEvent extends UdpEvent
	{
		/**
	* The OnReceiveEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>ipAddress</td><td>null</td></tr>
	* 
	* <tr><td>messageData</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		/**
	* The OnReceiveEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>ipAddress</td><td>null</td></tr>
	* 
	* <tr><td>messageData</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public var ipAddress:String = null;
		public var messageData:String = null;
		
		public function OnReceiveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnReceiveEvent = new OnReceiveEvent( type );
			return e;
		}
	}
}