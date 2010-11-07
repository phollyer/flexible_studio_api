package api.events.mouse.sendPress
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class SendPressEvent extends MouseEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_BUTTON:String = "invalidButton";
		public static const MISSING_BUTTON:String = "missingButton";
		
		public function SendPressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendPressEvent = new SendPressEvent( type );
			return e;
		}	
	}
}