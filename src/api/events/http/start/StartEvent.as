package api.events.http.start
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class StartEvent extends HttpEvent
	{
		
		public function StartEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StartEvent = new StartEvent(type);
			return e;
		}
	}
}