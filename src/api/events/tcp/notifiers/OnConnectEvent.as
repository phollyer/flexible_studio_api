package api.events.tcp.notifiers
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OnConnectEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var destinationAddress:String = null;
		
		public function OnConnectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnConnectEvent = new OnConnectEvent( type );
			e.destinationAddress = destinationAddress;
			return e;
		}
	}
}