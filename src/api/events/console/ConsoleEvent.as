package api.events.console
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class ConsoleEvent extends SWFStudioEvent
	{
		public function ConsoleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ConsoleEvent = new ConsoleEvent( type );
			return e;
		}
	}
}