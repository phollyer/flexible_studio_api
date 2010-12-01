package api.events.http.port
{
	import api.events.http.HttpEvent;
	
	import flash.events.Event;

	public class PortEvent extends HttpEvent
	{
		public static const INVALID_PORT_NUMBER:String = "invalidPortNumber";
		
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