package api.events.tcp
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class TcpEvent extends KernelEvent
	{
		public function TcpEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TcpEvent = new TcpEvent( type );
			return e;
		}
	}
}