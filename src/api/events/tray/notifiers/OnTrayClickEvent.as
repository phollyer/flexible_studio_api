package api.events.tray.notifiers
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class OnTrayClickEvent extends TrayEvent
	{		
		public static const COMPLETE:String = "complete";
		public static const STATUS:String = "status";
		
		public var button:String = null;
		
		public function OnTrayClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnTrayClickEvent = new OnTrayClickEvent( type );
			e.button = button;
			return e;
		}
	}
}