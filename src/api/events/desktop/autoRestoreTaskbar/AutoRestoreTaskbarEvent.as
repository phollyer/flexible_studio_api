package api.events.desktop.autoRestoreTaskbar
{
	import flash.events.Event;
	
	import api.events.desktop.DesktopEvent;

	public class AutoRestoreTaskbarEvent extends DesktopEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function AutoRestoreTaskbarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AutoRestoreTaskbarEvent = new AutoRestoreTaskbarEvent( type );
			return e;
		}
	}
}