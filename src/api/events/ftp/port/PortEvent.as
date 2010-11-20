package api.events.ftp.port
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class PortEvent extends FtpEvent
	{
		
	/**
	* The PortEvent.INVALID_PORT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidPortNumber</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidPortNumber
	*/
		public static const INVALID_PORT_NUMBER:String = "invalidPortNumber";
		
		public function PortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PortEvent = new PortEvent( type );
			return e;
		}
	}
}