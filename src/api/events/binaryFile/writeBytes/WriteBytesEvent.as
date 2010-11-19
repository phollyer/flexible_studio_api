package api.events.binaryFile.writeBytes
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class WriteBytesEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const INVALID_FORMAT:String = "invalidFormat";
		public static const RESULT:String = "result";
		
		public var bytesWritten:Number = 0;
		public var systemError:String = null;
		
		public function WriteBytesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteBytesEvent = new WriteBytesEvent( type );
			e.bytesWritten = bytesWritten;
			e.systemError = systemError;
			return e;
		}
	}
}