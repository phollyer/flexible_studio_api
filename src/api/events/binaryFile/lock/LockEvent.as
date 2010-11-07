package api.events.binaryFile.lock
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class LockEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var systemError:String = null;
		
		public function LockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LockEvent = new LockEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}