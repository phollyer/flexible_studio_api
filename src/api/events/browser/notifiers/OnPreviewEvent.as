package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnPreviewEvent extends BrowserEvent
	{
		public static const CHANGE:String = "change";
		
		public var url:String = null;
		
		public function OnPreviewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnPreviewEvent = new OnPreviewEvent( type );
			e.url = url;
			return e;
		}
	}
}