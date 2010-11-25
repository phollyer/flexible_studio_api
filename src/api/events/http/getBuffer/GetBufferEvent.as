package api.events.http.getBuffer
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetBufferEvent extends HttpEvent
	{
		
	/**
	* The GetBufferEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>bufferContent</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var bufferContent:String = null;
		
		public function GetBufferEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBufferEvent = new GetBufferEvent(type);
			e.bufferContent = bufferContent;
			return e;
		}
	}
}