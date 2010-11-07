package api.events.tcp.notifiers
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OnReceiveErrorEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var errorMessage:String = null;
		
		public function OnReceiveErrorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnReceiveErrorEvent = new OnReceiveErrorEvent( type );
			e.errorsMessage = errorMessage;
			return e;
		}
	}
}