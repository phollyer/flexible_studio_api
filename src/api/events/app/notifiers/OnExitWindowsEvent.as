package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnExitWindowsEvent extends AppEvent
	{
		public static const STATUS:String = "status";
		
		public var method:String = null;
		
		public function OnExitWindowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnExitWindowsEvent = new OnExitWindowsEvent( type );
			e.method = method;
			return e;
		}
	}
}