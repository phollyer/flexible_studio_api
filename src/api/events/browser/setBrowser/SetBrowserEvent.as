package api.events.browser.setBrowser
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetBrowserEvent extends BrowserEvent
	{
		
		public function SetBrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetBrowserEvent = new SetBrowserEvent( type );
			return e;
		}
	}
}