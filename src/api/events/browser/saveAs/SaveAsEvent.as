package api.events.browser.saveAs
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SaveAsEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SaveAsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SaveAsEvent = new SaveAsEvent( type );
			return e;
		}
	}
}