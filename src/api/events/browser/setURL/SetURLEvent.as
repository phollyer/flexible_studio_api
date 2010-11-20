package api.events.browser.setURL
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetURLEvent extends BrowserEvent
	{
		
		public function SetURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetURLEvent = new SetURLEvent( type );
			return e;
		}
	}
}