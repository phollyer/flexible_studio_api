package api.events.win.lockMaxSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class LockMaxSizeEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function LockMaxSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockMaxSizeEvent = new LockMaxSizeEvent( type );
			return e;
		}
	}
}