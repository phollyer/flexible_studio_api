package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnQuitEvent extends AppEvent
	{
		public static const STATUS:String = "status";
		
		public function OnQuitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnQuitEvent = new OnQuitEvent( type );
			return e;
		}
	}
}