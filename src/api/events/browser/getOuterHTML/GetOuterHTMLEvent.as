package api.events.browser.getOuterHTML
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetOuterHTMLEvent extends BrowserEvent
	{
		/**
	* The GetOuterHTMLEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>outerHTML</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var outerHTML:String = null;
		
		public function GetOuterHTMLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetOuterHTMLEvent = new GetOuterHTMLEvent( type );
			e.outerHTML = outerHTML;
			return e;
		}
	}
}