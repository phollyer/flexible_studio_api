package api.events.binaryFile.open
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class OpenEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public var systemError:String = null;
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}