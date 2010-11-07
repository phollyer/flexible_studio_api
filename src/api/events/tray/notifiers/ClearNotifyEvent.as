package api.events.tray.notifiers
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class ClearNotifyEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_EVENT:String = "missingEvent";
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}