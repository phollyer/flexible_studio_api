package api.events.browser.search
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SearchEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SearchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SearchEvent = new SearchEvent( type );
			return e;
		}
	}
}