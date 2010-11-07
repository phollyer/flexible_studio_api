package api.events.browser.clearGuides
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ClearGuidesEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ClearGuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearGuidesEvent = new ClearGuidesEvent( type );
			return e;
		}
	}
}