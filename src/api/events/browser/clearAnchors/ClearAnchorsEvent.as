package api.events.browser.clearAnchors
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ClearAnchorsEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ClearAnchorsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearAnchorsEvent = new ClearAnchorsEvent( type );
			return e;
		}
	}
}