package api.events.browser.getSource
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetSourceEvent extends BrowserEvent
	{
		/**
	* The GetSourceEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>source</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var source:String = null;
		
		public function GetSourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetSourceEvent = new GetSourceEvent( type );
			e.source = source;
			return e;
		}
	}
}