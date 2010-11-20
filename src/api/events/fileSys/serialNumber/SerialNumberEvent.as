package api.events.fileSys.serialNumber
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class SerialNumberEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DRIVE:String = "missingDrive";
		public static const RESULT:String = "result";
		
		public var number:String = null;
		
		public function SerialNumberEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SerialNumberEvent = new SerialNumberEvent( type );
			e.number = number;
			return e;
		}
	}
}