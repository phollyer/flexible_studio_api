package api.events.win.lockMinSize
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class LockMinSizeEvent extends WinEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function LockMinSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockMinSizeEvent = new LockMinSizeEvent(type);
			return e;
		}
	}
}