package api.events.udp.notifiers
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class OnReceiveEvent extends UdpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var ipAddress:String = null;
		public var messageData:String = null;
		
		public function OnReceiveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnReceiveEvent = new OnReceiveEvent( type );
			return e;
		}
	}
}