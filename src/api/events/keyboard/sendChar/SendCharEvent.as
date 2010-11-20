package api.events.keyboard.sendChar
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class SendCharEvent extends KeyboardEvent
	{
		public static const MISSING_HWND:String = "missingHwnd"
		
		public function SendCharEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendCharEvent = new SendCharEvent( type );
			return e;
		}
	}
}