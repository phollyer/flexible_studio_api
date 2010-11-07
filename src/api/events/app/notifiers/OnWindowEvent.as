package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnWindowEvent extends AppEvent
	{
		public static const STATUS:String = "status";
		
		public var caption:String = null;
		public var hwnd:String = null;
		public var windowClassName:String = null;
		public var windowStyle:String = null;
		
		public function OnWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnWindowEvent = new OnWindowEvent( type );
			e.caption = caption;
			e.hwnd = hwnd;
			e.windowClassName = windowClassName;
			e.windowStyle = windowStyle;
			return e;
		}
	}
}