package api.events.binaryFile.setSize
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class SetSizeEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_SIZE:String = "invalidSize";
		
		public var systemError:String = null;
		
		public function SetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetSizeEvent = new SetSizeEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}