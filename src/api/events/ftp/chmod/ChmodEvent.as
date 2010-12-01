package api.events.ftp.chmod
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class ChmodEvent extends FtpEvent
	{
		
	/**
	* The ChmodEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>errorDetails</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var errorDetails:String = null;
		
		public function ChmodEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ChmodEvent = new ChmodEvent( type );
			e.errorDetails = errorDetails;
			return e;
		}
	}
}