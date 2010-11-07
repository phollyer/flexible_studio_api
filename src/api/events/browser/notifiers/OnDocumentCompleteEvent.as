package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnDocumentCompleteEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var url:String = null;
		
		public function OnDocumentCompleteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDocumentCompleteEvent = new OnDocumentCompleteEvent( type );
			e.url = url;
			return e;
		}
	}
}