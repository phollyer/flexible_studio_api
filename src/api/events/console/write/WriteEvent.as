package api.events.console.write
{
	import flash.events.Event;
	
	import api.events.console.ConsoleEvent;

	public class WriteEvent extends ConsoleEvent
	{
		
		public function WriteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteEvent = new WriteEvent( type );
			return e;
		}
	}
}