package api.events.udp.close
{
	import flash.events.Event;
	
	import api.events.udp.UdpEvent;

	public class CloseEvent extends UdpEvent
	{
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			return e;
		}
	}
}