package api.events.binaryFile.getFilePointer
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class GetFilePointerEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var pointerIndex:Number = 0;
		public var systemError:String = null;
		
		public function GetFilePointerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFilePointerEvent = new GetFilePointerEvent( type );
			e.pointerIndex = pointerIndex;
			e.systemError = systemError;
			return e;
		}
	}
}