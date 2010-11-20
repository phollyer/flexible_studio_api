package api.events.http.read
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ReadEvent extends HttpEvent
	{
		public static const RESULT:String = "result";
		
		public function ReadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadEvent = new ReadEvent(type);
			return e;
		}
	}
}