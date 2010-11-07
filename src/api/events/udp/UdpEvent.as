package api.events.udp
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class UdpEvent extends KernelEvent
	{
		public function UdpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UdpEvent = new UdpEvent( type );
			return e;
		}
	}
}