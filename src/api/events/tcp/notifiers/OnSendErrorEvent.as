package api.events.tcp.notifiers
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OnSendErrorEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var errorMessage:String = null;
		
		public function OnSendErrorEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnSendErrorEvent = new OnSendErrorEvent( type );
			e.errorsMessage = errorMessage;
			return e;
		}
	}
}