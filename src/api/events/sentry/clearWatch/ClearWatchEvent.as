package api.events.sentry.clearWatch
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class ClearWatchEvent extends SentryEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ClearWatchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearWatchEvent = new ClearWatchEvent( type );
			return e;
		}
	}
}