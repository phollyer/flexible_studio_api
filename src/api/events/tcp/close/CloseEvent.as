package api.events.tcp.close
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class CloseEvent extends TcpEvent
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