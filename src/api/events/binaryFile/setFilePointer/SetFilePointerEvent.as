package api.events.binaryFile.setFilePointer
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class SetFilePointerEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var systemError:String = null;
		
		public function SetFilePointerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFilePointerEvent = new SetFilePointerEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}