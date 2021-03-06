package api.events.mouse.lock
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class LockEvent extends MouseEvent
	{
		
		public function LockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockEvent = new LockEvent( type );
			return e;
		}
	}
}