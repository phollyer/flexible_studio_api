package api.events.tcp.notifiers
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OnReceiveEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var messageData:String = null;
		
		public function OnReceiveEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnReceiveEvent = new OnReceiveEvent( type );
			e.messageData = messageData;
			return e;
		}
	}
}