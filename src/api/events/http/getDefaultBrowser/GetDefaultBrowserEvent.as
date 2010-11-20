package api.events.http.getDefaultBrowser
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultBrowserEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var browser:String = null;
		
		public function GetDefaultBrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultBrowserEvent = new GetDefaultBrowserEvent( type );
			e.browser = browser;
			return e;
		}
	}
}