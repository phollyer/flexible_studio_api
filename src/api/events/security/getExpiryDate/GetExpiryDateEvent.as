package api.events.security.getExpiryDate
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class GetExpiryDateEvent extends SecurityEvent
	{
		
	/**
	* The GetExpiryDateEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>dateString</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var dateString:String = null;
		public var day:Number = -1;
		public var hour:Number = -1;
		public var minute:Number = -1;
		public var month:Number = -1;
		public var second:Number = -1;
		public var year:Number = -1;
		
		public function GetExpiryDateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetExpiryDateEvent = new GetExpiryDateEvent( type );
			e.dateString = dateString;
			e.day = day;
			e.hour = hour;
			e.minute = minute;
			e.month = month;
			e.second = second;
			e.year = year;
			return e;
		}
	}
}