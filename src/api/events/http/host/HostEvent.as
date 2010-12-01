package api.events.http.host
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class HostEvent extends HttpEvent
	{
		
		public function HostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HostEvent = new HostEvent( type );
			return e;
		}
	}
}