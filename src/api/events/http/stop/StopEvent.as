package api.events.http.stop
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class StopEvent extends HttpEvent
	{
		
		public function StopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StopEvent = new StopEvent(type);
			return e;
		}
	}
}