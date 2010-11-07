package api.events.browser.setSize
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetSizeEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			return e;
		}
	}
}