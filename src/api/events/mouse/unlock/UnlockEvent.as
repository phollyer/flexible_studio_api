package api.events.mouse.unlock
{
	import flash.events.Event;
	
	import api.binaryFile.unlock.Unlock;
	import api.events.mouse.MouseEvent;

	public class UnlockEvent extends MouseEvent
	{
		
		public function UnlockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UnlockEvent = new UnlockEvent( type );
			return e;
		}
	}
}