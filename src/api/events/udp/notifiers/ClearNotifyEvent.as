package api.events.udp.notifiers
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class ClearNotifyEvent extends UdpEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}