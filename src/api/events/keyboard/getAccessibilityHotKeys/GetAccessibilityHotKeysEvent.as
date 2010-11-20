package api.events.keyboard.getAccessibilityHotKeys
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class GetAccessibilityHotKeysEvent extends KeyboardEvent
	{
		/**
	* The GetAccessibilityHotKeysEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";

		public var filter:String = null;
		public var highContrast:String = null;
		public var mouse:String = null;
		public var sticky:String = null;
		public var toggle:String = null;
		
		public function GetAccessibilityHotKeysEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetAccessibilityHotKeysEvent = new GetAccessibilityHotKeysEvent( type );
			e.filter = filter;
			e.highContrast = highContrast;
			e.mouse = mouse;
			e.sticky = sticky;
			e.toggle = toggle;
			return e;
		}
	}
}