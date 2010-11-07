package api.events.browser.getOuterHTML
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class GetOuterHTMLEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var outerHTML:String = null;
		
		public function GetOuterHTMLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetOuterHTMLEvent = new GetOuterHTMLEvent( type );
			e.outerHTML = outerHTML;
			return e;
		}
	}
}