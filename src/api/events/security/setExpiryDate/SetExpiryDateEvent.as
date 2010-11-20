package api.events.security.setExpiryDate
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class SetExpiryDateEvent extends SecurityEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_DATE:String = "invalidDate";
		
		public function SetExpiryDateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetExpiryDateEvent = new SetExpiryDateEvent( type );
			return e;
		}
	}
}