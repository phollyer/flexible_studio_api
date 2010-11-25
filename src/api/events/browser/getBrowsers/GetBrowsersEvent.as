package api.events.browser.getBrowsers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetBrowsersEvent extends BrowserEvent
	{
		
	/**
	* The GetBrowsersEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>browserList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var browserList:Array = null;
		
		public function GetBrowsersEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBrowsersEvent = new GetBrowsersEvent( type );
			e.browserList = browserList;
			return e;
		}
	}
}