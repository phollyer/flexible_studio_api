package api.events.browser.showScrollbars
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class ShowScrollbarsEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ShowScrollbarsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowScrollbarsEvent = new ShowScrollbarsEvent( type );
			return e;
		}
	}
}