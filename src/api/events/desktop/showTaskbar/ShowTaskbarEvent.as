package api.events.desktop.showTaskbar
{
	import flash.events.Event;
	
	import api.events.desktop.DesktopEvent;

	public class ShowTaskbarEvent extends DesktopEvent
	{
		
		public function ShowTaskbarEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowTaskbarEvent = new ShowTaskbarEvent( type );
			return e;
		}
	}
}