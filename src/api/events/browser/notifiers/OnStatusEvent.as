package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnStatusEvent extends BrowserEvent
	{
		public static const CHANGE:String = "change";
		
		public var text:String = null;
		
		public function OnStatusEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnStatusEvent = new OnStatusEvent( type );
			e.text = text;
			return e;
		}
	}
}