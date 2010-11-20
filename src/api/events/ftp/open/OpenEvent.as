package api.events.ftp.open
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class OpenEvent extends FtpEvent
	{
		
	/**
	* The OpenEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>isOpen</td><td>false</td></tr>
	* 
	* <tr><td>status</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var isOpen:Boolean = false;
		public var status:String = null;
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			e.isOpen = isOpen;
			e.status = status;
			return e;
		}
	}
}