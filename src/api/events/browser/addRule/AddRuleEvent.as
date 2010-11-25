package api.events.browser.addRule
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class AddRuleEvent extends BrowserEvent
	{
		
	/**
	* The AddRuleEvent.INVALID_TYPE constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>invalidType</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType invalidType
	*/
		public static const INVALID_TYPE:String = "invalidType";
		
		public function AddRuleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddRuleEvent = new AddRuleEvent( type );
			return e;
		}
	}
}