package api.events.console.open
{
	import flash.events.Event;
	
	import api.events.console.ConsoleEvent;

	public class OpenEvent extends ConsoleEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			return e;
		}
	}
}