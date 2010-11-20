package api.events.browser.setPosition
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetPositionEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "COMPLETE";
			
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPositionEvent = new SetPositionEvent( type );
			return e;
		}
	}
}