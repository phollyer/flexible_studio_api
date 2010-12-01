package api.events.tcp
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class TcpEvent extends SWFStudioEvent
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