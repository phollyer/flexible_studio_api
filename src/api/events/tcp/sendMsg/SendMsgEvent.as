package api.events.tcp.sendMsg
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class SendMsgEvent extends TcpEvent
	{
		
		public function SendMsgEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SendMsgEvent = new SendMsgEvent( type );
			return e;
		}
	}
}