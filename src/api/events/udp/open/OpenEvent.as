package api.events.udp.open
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class OpenEvent extends UdpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PORT:String = "missingPort";
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			return e;
		}
	}
}