package api.events.ftp.port
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class PortEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const INVALID_PORT_NUMBER:String = "invalidPortNumber";
		
		public function PortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PortEvent = new PortEvent( type );
			return e;
		}
	}
}