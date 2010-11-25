package api.events.http.getContentLength
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetContentLengthEvent extends HttpEvent
	{
		
	/**
	* The GetContentLengthEvent.RESULT constant defines the value of the
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
		
		public var totalBytes:Number = -1;
		
		public function GetContentLengthEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : GetContentLengthEvent = new GetContentLengthEvent(type);
			e.totalBytes = totalBytes;
			return e;
		}
	}
}