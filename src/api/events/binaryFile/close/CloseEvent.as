package api.events.binaryFile.close
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class CloseEvent extends BinaryFileEvent
	{
		public static const COMPLETE:String = "complete";
		
		public var systemError:String = null;
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}