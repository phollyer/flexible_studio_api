package api.events.security.isExpired
{
	import flash.events.Event;
	
	import api.events.security.SecurityEvent;

	public class IsExpiredEvent extends SecurityEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var expired:Boolean = false;
		
		public function IsExpiredEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsExpiredEvent = new IsExpiredEvent( type );
			e.expired = expired;
			return e;
		}
	}
}