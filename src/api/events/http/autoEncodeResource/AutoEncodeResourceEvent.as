package api.events.http.autoEncodeResource
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class AutoEncodeResourceEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function AutoEncodeResourceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AutoEncodeResourceEvent = new AutoEncodeResourceEvent( type );
			return e;
		}
	}
}