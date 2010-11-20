package api.events.desktop
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class DesktopEvent extends KernelEvent
	{
		public function DesktopEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DesktopEvent = new DesktopEvent( type );
			return e;
		}
	}
}