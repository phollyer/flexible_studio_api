package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnActiveElementChangeEvent extends BrowserEvent
	{
		/**
	* The OnActiveElementChangeEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>href</td><td>null</td></tr>
	* 
	* <tr><td>html</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		
		public var href:String = null;
		public var html:String = null;
		
		public function OnActiveElementChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnActiveElementChangeEvent = new OnActiveElementChangeEvent( type );
			e.href = href;
			e.html = html;
			return e;
		}
	}
}