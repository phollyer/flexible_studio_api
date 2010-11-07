package api.events.ftp.open
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class OpenEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var isOpen:Boolean = false;
		public var status:String = null;
		
		public function OpenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OpenEvent = new OpenEvent( type );
			e.isOpen = isOpen;
			e.status = status;
			return e;
		}
	}
}