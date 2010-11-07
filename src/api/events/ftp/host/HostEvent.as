package api.events.ftp.host
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class HostEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_HOST:String = "missingHost";
		
		public function HostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:HostEvent = new HostEvent(type);
			return newEvent;
		}
	}
}