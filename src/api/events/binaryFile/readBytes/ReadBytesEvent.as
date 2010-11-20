package api.events.binaryFile.readBytes
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class ReadBytesEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FORMAT:String = "missingFormat";
		public static const RESULT:String = "result";
		
		public var bytesRead:Number = 0;
		public var systemError:String = null;
		public var text:String = null;
		
		public function ReadBytesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadBytesEvent = new ReadBytesEvent( type );
			e.bytesRead = bytesRead;
			e.systemError = systemError;
			e.text = text;
			return e;
		}
	}
}