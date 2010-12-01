package api.events.win.lockAspectRatio
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class LockAspectRatioEvent extends WinEvent
	{
		
		public function LockAspectRatioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockAspectRatioEvent = new LockAspectRatioEvent( type );
			return e;
		}
	}
}