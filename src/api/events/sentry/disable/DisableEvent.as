package api.events.sentry.disable
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class DisableEvent extends SentryEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function DisableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DisableEvent = new DisableEvent( type );
			return e;
		}
	}
}