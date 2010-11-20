package api.events.mouse.sendDoubleClick
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class SendDoubleClickEvent extends MouseEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_BUTTON:String = "invalidButton";
		public static const MISSING_BUTTON:String = "missingButton";
		
		public function SendDoubleClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendDoubleClickEvent = new SendDoubleClickEvent( type );
			return e;
		}
	}
}