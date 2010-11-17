package api.events.binaryFile.getSize
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class GetSizeEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var fileSize:Number = 0;
		public var systemError:String = null;
		
		public function GetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetSizeEvent = new GetSizeEvent( type );
			e.fileSize = fileSize;
			e.systemError = systemError;
			return e;
		}
	}
}