package api.events.browser.getHREF
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetHREFEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var href:String = null;
		
		public function GetHREFEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetHREFEvent = new GetHREFEvent( type );
			e.href = href;
			return e;
		}
	}
}