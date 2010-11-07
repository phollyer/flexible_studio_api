package api.events.browser.allowMenu
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class AllowMenuEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function AllowMenuEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AllowMenuEvent = new AllowMenuEvent( type );
			return e;
		}
	}
}