package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnBlockedPopUpEvent extends BrowserEvent
	{
		public static const STATUS:String = "status";
		
		public var url:String = null;
		
		public function OnBlockedPopUpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnBlockedPopUpEvent = new OnBlockedPopUpEvent( type );
			e.url = url;
			return e;
		}
	}
}