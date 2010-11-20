package api.events.sentry.addWatch
{
	import flash.events.Event;
	
	import api.events.sentry.SentryEvent;

	public class AddWatchEvent extends SentryEvent
	{
		
		public function AddWatchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddWatchEvent = new AddWatchEvent( type );
			return e;
		}
	}
}