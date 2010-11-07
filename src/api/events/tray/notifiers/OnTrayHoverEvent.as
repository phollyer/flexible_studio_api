package api.events.tray.notifiers
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class OnTrayHoverEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public function OnTrayHoverEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTrayHoverEvent = new OnTrayHoverEvent( type );
			return e;
		}
	}
}