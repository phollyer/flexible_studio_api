package api.events.binaryFile.flushToDisk
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class FlushToDiskEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var systemError:String = null;
		
		public function FlushToDiskEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FlushToDiskEvent = new FlushToDiskEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}