package api.events.app.forceExitWindows
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ForceExitWindowsEvent extends AppEvent
	{		
		public function ForceExitWindowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ForceExitWindowsEvent = new ForceExitWindowsEvent( type );
			return e;
		}
	}
}