package api.events.win.startDrag
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class StartDragEvent extends WinEvent
	{
		
		public function StartDragEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : StartDragEvent = new StartDragEvent( type );
			return e;
		}
	}
}