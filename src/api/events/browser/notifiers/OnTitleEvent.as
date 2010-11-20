package api.events.browser.notifiers
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class OnTitleEvent extends BrowserEvent
	{
		public static const CHANGE:String = "change";
		
		public var title:String = null;
		
		public function OnTitleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTitleEvent = new OnTitleEvent( OnTitleEvent.CHANGE );
			e.title = title;
			return e;
		}	
	}
}