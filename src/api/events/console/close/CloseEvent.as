package api.events.console.close
{
	import flash.events.Event;
	
	import api.events.console.ConsoleEvent;

	public class CloseEvent extends ConsoleEvent
	{
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			return e;
		}
	}
}