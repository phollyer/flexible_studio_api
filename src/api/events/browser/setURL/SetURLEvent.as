package api.events.browser.setURL
{
	import flash.events.Event;
	
	import api.events.browser.BrowserEvent;

	public class SetURLEvent extends BrowserEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_URL:String = "missingURL";
		
		public function SetURLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetURLEvent = new SetURLEvent( type );
			return e;
		}
	}
}