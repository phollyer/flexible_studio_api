package api.events.http.notifiers
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ClearNotifyEvent extends HttpEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}