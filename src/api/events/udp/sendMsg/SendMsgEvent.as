package api.events.udp.sendMsg
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class SendMsgEvent extends UdpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const MISSING_DESTINATION:String = "missingDestination";
		
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