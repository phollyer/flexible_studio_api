package api.events.browser.home
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class HomeEvent extends BrowserEvent
	{
		
		public function HomeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HomeEvent = new HomeEvent( type );
			return e;
		}
	}
}