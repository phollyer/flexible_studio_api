package api.events.http.port
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class PortEvent extends HttpEvent
	{
		
		public function PortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PortEvent = new PortEvent( type );
			return e;
		}
	}
}