package api.events.keyboard.sendString
{
	import flash.events.Event;
	import api.events.keyboard.KeyboardEvent

	public class SendStringEvent extends KeyboardEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HWND:String = "missingHwnd";
		public static const MISSING_TEXT:String = "missingText";
		
		public function SendStringEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendStringEvent = new SendStringEvent( type );
			return e;
		}
	}
}