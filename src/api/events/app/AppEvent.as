package api.events.app
{
	import flash.events.Event;	
	import api.events.SWFStudioEvent;

	public class AppEvent extends SWFStudioEvent
	{
		public static const LOGGING_OFF:String = "loggingOff";
		public static const REBOOTING:String = "rebooting";
		public static const SHUTTING_DOWN:String = "shuttingDown";
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppEvent = new AppEvent(type);
			return e;
		}
	}
}