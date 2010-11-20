package api.events.browser.addRule
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class AddRuleEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_TYPE:String = "invalidType";
		public static const MISSING_PATTERN:String = "missingPattern";
		public static const MISSING_TYPE:String = "missingType";
		
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