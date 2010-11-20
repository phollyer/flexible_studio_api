package api.events.sentry
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class SentryEvent extends SWFStudioEvent
	{
		public function SentryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SentryEvent = new SentryEvent( type );
			return e;
		}
	}
}