package api.events.browser.refresh
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class RefreshEvent extends BrowserEvent
	{
		
		public function RefreshEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RefreshEvent = new RefreshEvent( type );
			return e;
		}
	}
}