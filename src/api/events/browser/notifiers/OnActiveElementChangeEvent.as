package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnActiveElementChangeEvent extends BrowserEvent
	{
		public static const CHANGE:String = "change";
		
		public var href:String = null;
		public var html:String = null;
		
		public function OnActiveElementChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnActiveElementChangeEvent = new OnActiveElementChangeEvent( type );
			e.href = href;
			e.html = html;
			return e;
		}
	}
}