package api.events.tcp.listen
{
	import flash.events.Event;
	
	import api.events.tcp.TcpEvent;

	public class ListenEvent extends TcpEvent
	{
		
		public function ListenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ListenEvent = new ListenEvent( type );
			return e;
		}
	}
}