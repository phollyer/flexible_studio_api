package api.events.browser.back
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class BackEvent extends BrowserEvent
	{
		
		public function BackEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BackEvent = new BackEvent( type );
			return e;
		}
	}
}