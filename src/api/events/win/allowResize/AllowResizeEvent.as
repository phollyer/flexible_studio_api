package api.events.win.allowResize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class AllowResizeEvent extends WinEvent
	{
		
		public function AllowResizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AllowResizeEvent = new AllowResizeEvent( type );
			return e;
		}
	}
}