package api.events.browser.allowDragDrop
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class AllowDragDropEvent extends BrowserEvent
	{
		
		public function AllowDragDropEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AllowDragDropEvent = new AllowDragDropEvent( type );
			return e;
		}
	}
}