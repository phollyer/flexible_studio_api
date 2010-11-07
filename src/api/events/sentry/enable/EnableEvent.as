package api.events.sentry.enable
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class EnableEvent extends SentryEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function EnableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : EnableEvent = new EnableEvent( type );
			return e;
		}
	}
}