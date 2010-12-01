package api.events.desktop.changeResolution
{
	import flash.events.Event;
	
	import api.events.desktop.DesktopEvent;

	public class ChangeResolutionEvent extends DesktopEvent
	{
		
		public function ChangeResolutionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ChangeResolutionEvent = new ChangeResolutionEvent( type );
			return e;
		}
	}
}