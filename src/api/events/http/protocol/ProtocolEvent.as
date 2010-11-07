package api.events.http.protocol
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProtocolEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function ProtocolEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ProtocolEvent = new ProtocolEvent( type );
			return e;
		}
	}
}