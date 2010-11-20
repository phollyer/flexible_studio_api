package api.events.http.method
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class MethodEvent extends HttpEvent
	{
		
		public function MethodEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MethodEvent = new MethodEvent( type );
			return e;
		}
	}
}