package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnBlockedURLEvent extends BrowserEvent
	{
		public static const STATUS:String = "status";
		
		public var url:String = null;
		
		public function OnBlockedURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e :OnBlockedURLEvent = new OnBlockedURLEvent( type );
			e.url = url;
			return e;
		}
	}
}