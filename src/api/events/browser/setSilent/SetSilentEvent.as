package api.events.browser.setSilent
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetSilentEvent extends BrowserEvent
	{
		
		public function SetSilentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSilentEvent = new SetSilentEvent( type );
			return e;
		}
	}
}