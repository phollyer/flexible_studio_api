package api.events.udp.broadcastMsg
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class BroadcastMsgEvent extends UdpEvent
	{
		
		public function BroadcastMsgEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BroadcastMsgEvent = new BroadcastMsgEvent( type );
			return e;
		}
	}
}