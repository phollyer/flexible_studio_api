package api.events.binaryFile.create
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class CreateEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public var systemError:String = null;
		
		public function CreateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateEvent = new CreateEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}