package api.events.http.host
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class HostEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HOST:String = "missingHost";
		
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