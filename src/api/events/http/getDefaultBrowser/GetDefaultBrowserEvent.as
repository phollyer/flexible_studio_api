package api.events.http.getDefaultBrowser
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultBrowserEvent extends HttpEvent
	{
		/**
	* The GetDefaultBrowserEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>browser</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var browser:String = null;
		
		public function GetDefaultBrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultBrowserEvent = new GetDefaultBrowserEvent( type );
			e.browser = browser;
			return e;
		}
	}
}