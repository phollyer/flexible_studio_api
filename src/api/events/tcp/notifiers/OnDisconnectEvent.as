package api.events.tcp.notifiers
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OnDisconnectEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var message:String = null;
		
		public function OnDisconnectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDisconnectEvent = new OnDisconnectEvent( type );
			e.message = message;
			return e;
		}
	}
}