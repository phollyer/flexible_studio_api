package api.events.browser.close
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class CloseEvent extends BrowserEvent
	{
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			return e;
		}
	}
}