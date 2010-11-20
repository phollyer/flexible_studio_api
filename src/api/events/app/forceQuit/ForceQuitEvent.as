package api.events.app.forceQuit
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ForceQuitEvent extends AppEvent
	{		
		public function ForceQuitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ForceQuitEvent = new ForceQuitEvent( type );
			return e;
		}
	}
}