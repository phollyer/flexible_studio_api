package api.events.sentry.removeWatch
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class RemoveWatchEvent extends SentryEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_APPLICATION:String = "missingApplication";
		
		public function RemoveWatchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveWatchEvent = new RemoveWatchEvent( type );
			return e;
		}
	}
}