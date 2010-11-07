package api.events.keyboard.sendKey
{
	import flash.events.Event;
	
	import api.events.keyboard.KeyboardEvent;

	public class SendKeyEvent extends KeyboardEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HWND:String = "missingHwnd";
		public static const MISSING_KEY:String = "missingKey";
		
		public function SendKeyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendKeyEvent = new SendKeyEvent( type );
			return e;
		}
	}
}