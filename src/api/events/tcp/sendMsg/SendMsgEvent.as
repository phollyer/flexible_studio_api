package api.events.tcp.sendMsg
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class SendMsgEvent extends TcpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		
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