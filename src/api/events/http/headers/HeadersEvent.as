package api.events.http.headers
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class HeadersEvent extends HttpEvent
	{
		
		public function HeadersEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HeadersEvent = new HeadersEvent( type );
			return e;
		}	
	}
}