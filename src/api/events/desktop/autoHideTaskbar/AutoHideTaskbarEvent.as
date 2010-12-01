package api.events.desktop.autoHideTaskbar
{
	import flash.events.Event;
	
	import api.events.desktop.DesktopEvent;

	public class AutoHideTaskbarEvent extends DesktopEvent
	{
		
		public function AutoHideTaskbarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AutoHideTaskbarEvent = new AutoHideTaskbarEvent( type );
			return e;
		}
	}
}