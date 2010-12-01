package api.events.fileSys.getTimeStamp
{
	import flash.events.Event;

	public class GetTimeStampEvent extends Event
	{
		
	/**
	* The GetTimeStampEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>date</td><td>null</td></tr>
	* 
	* <tr><td>timeStamp</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var date:Date = null;
		public var hours:Number = -1;
		public var minutes:Number = -1;
		public var seconds:Number = -1;
		public var timeStamp:String = null;
		
		public function GetTimeStampEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : GetTimeStampEvent = new GetTimeStampEvent( type );
			e.date = date;
			e.hours = hours;
			e.minutes = minutes;
			e.seconds = seconds;
			e.timeStamp = timeStamp;
			return e;
		}
	}
}