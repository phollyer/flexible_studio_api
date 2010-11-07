package api.events.tray.notifiers
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class OnTrayDoubleClickEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var button:String = null;
		
		public function OnTrayDoubleClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTrayDoubleClickEvent = new OnTrayDoubleClickEvent( type );
			e.button = button;
			return e;
		}
	}
}