package api.events.udp.sendMsg
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class SendMsgEvent extends UdpEvent
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