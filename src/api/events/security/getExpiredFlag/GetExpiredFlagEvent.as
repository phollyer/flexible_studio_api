package api.events.security.getExpiredFlag
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class GetExpiredFlagEvent extends SecurityEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var expired:Boolean = false;
		
		public function GetExpiredFlagEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetExpiredFlagEvent = new GetExpiredFlagEvent( type );
			e.expired = expired;
			return e;
		}
	}
}