package api.events.browser
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class BrowserEvent extends SWFStudioEvent
	{		
		public function BrowserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BrowserEvent = new BrowserEvent(type);
			return e;
		}
	}
}