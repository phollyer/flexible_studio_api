package api.events.app.trace
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class TraceEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function TraceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TraceEvent = new TraceEvent( type );
			return e;
		}
	}
}