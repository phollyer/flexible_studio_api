package api.events.browser.stop
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class StopEvent extends BrowserEvent
	{
		
		public function StopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopEvent = new StopEvent( type );
			return e;
		}	
	}
}