package api.events.browser.clearRules
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ClearRulesEvent extends BrowserEvent
	{
		
		public function ClearRulesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearRulesEvent = new ClearRulesEvent( type );
			return e;
		}
	}
}