package api.events.browser.open
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OpenEvent extends BrowserEvent
	{
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			return e;
		}
	}
}