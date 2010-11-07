package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnNavigateEvent extends BrowserEvent
	{
		public static const CHANGE:String = "change";
		
		public var url:String = null;
		
		public function OnNavigateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnNavigateEvent = new OnNavigateEvent( type );
			e.url = url;
			return e;
		}
	}
}