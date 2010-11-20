package api.events.browser.setAnchors
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetAnchorsEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetAnchorsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetAnchorsEvent = new SetAnchorsEvent( type );
			return e;
		}
	}
}