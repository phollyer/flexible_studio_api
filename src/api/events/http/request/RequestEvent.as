package api.events.http.request
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class RequestEvent extends HttpEvent
	{
		
		public function RequestEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RequestEvent = new RequestEvent( type );
			return e;
		}
	}
}