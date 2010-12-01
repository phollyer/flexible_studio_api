package api.events.tcp.open
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class OpenEvent extends TcpEvent
	{
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			return e;
		}
	}
}