package api.events.ftp.direction
{
	import api.events.ftp.FtpEvent;
	
	import flash.events.Event;

	public class DirectionEvent extends FtpEvent
	{
		public static const INVALID_VALUE:String = "invalidValue";
		
	/**
	* The DirectionEvent.INCORRECT_VALUE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>incorrectValue</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType incorrectValue
	*/
		public static const INCORRECT_VALUE:String = "incorrectValue";
		
		public function DirectionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DirectionEvent = new DirectionEvent( type );
			return e;
		}
	}
}