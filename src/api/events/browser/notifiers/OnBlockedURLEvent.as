package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnBlockedURLEvent extends BrowserEvent
	{
		
	/**
	* The OnBlockedURLEvent.STATUS constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>status</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>url</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType status
	*/
		public static const STATUS:String = "status";
		
		public var url:String = null;
		
		public function OnBlockedURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e :OnBlockedURLEvent = new OnBlockedURLEvent( type );
			e.url = url;
			return e;
		}
	}
}