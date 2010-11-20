package api.events.browser.forward
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ForwardEvent extends BrowserEvent
	{
		
		public function ForwardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ForwardEvent = new ForwardEvent( type );
			return e;
		}
	}
}