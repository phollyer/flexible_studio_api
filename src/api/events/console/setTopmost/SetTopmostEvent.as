package api.events.console.setTopmost
{
	import flash.events.Event;
	
	import api.events.console.ConsoleEvent;

	public class SetTopmostEvent extends ConsoleEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetTopmostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetTopmostEvent = new SetTopmostEvent( type );
			return e;
		}
	}
}