package api.events.browser.getURL
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetURLEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var url:String = null;
		
		public function GetURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetURLEvent = new GetURLEvent( type );
			e.url = url;
			return e;
		}
	}
}