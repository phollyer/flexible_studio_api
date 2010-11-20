package api.events.http.local
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class LocalEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function LocalEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LocalEvent = new LocalEvent(type);
			return e;
		}
	}
}