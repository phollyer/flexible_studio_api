package api.events.browser.setGuides
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetGuidesEvent extends BrowserEvent
	{
		
		public function SetGuidesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e :SetGuidesEvent = new SetGuidesEvent( type );
			return e;
		}
	}
}