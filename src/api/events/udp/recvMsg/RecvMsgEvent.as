package api.events.udp.recvMsg
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class RecvMsgEvent extends UdpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function RecvMsgEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RecvMsgEvent = new RecvMsgEvent( type );
			return e;
		}
	}
}