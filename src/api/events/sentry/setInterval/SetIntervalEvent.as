package api.events.sentry.setInterval
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class SetIntervalEvent extends SentryEvent
	{
		
		public function SetIntervalEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetIntervalEvent = new SetIntervalEvent( type );
			return e;
		}
	}
}