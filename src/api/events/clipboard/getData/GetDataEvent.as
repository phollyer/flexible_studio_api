package api.events.clipboard.getData
{
	import flash.events.Event;
	
	import api.events.clipboard.ClipboardEvent;

	public class GetDataEvent extends ClipboardEvent
	{
		/**
	* The GetDataEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>data</td><td>null</td></tr>
	* 
	* <tr><td>dataType</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var data:Object = null;
		public var dataType:Object = null;
		
		public function GetDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDataEvent = new GetDataEvent( type );
			e.data = data;
			e.dataType = dataType
			return e;
		}
	}
}