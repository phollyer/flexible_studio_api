package api.events.http.bufferSize
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class BufferSizeEvent extends HttpEvent
	{
		
		public function BufferSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BufferSizeEvent = new BufferSizeEvent( type );
			return e;
		}
	}
}