package api.events.activeX.isRegistered
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class IsRegisteredEvent extends ActiveXEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PROG_ID:String = "missingProgID";
		public static const RESULT:String = "result";
		
		public var registered:Boolean = false;
		
		public function IsRegisteredEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsRegisteredEvent = new IsRegisteredEvent( type );
			e.registered = registered;
			return e;
		}
	}
}