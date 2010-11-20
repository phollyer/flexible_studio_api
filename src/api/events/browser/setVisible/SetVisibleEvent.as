package api.events.browser.setVisible
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetVisibleEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetVisibleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetVisibleEvent = new SetVisibleEvent( type );
			return e;
		}
	}
}