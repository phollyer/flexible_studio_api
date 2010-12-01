package api.events.win.lockWindow
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class LockWindowEvent extends WinEvent
	{
		
		public function LockWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockWindowEvent = new LockWindowEvent( type );
			return e;
		}
	}
}