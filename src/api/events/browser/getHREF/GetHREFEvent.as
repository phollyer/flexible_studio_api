package api.events.browser.getHREF
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetHREFEvent extends BrowserEvent
	{
		
	/**
	* The GetHREFEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>href</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var href:String = null;
		
		public function GetHREFEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetHREFEvent = new GetHREFEvent( type );
			e.href = href;
			return e;
		}
	}
}