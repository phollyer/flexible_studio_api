package api.events.browser.getBrowsers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetBrowsersEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var browserList:Array = null;
		
		public function GetBrowsersEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetBrowsersEvent = new GetBrowsersEvent( type );
			e.browserList = browserList;
			return e;
		}
	}
}