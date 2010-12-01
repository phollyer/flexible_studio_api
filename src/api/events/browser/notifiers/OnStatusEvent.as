package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnStatusEvent extends BrowserEvent
	{
		
	/**
	* The OnStatusEvent.CHANGE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>change</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>text</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType change
	*/
		public static const CHANGE:String = "change";
		
		public var text:String = null;
		
		public function OnStatusEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnStatusEvent = new OnStatusEvent( type );
			e.text = text;
			return e;
		}
	}
}