package api.events.binaryFile.unlock
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class UnlockEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var systemError:String = null;
		
		public function UnlockEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UnlockEvent = new UnlockEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}