package api.events.browser.redirectPopups
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class RedirectPopupsEvent extends BrowserEvent
	{
		
		public function RedirectPopupsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RedirectPopupsEvent = new RedirectPopupsEvent( type )
			return e;
		}
	}
}