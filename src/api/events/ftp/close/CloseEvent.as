package api.events.ftp.close
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class CloseEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:CloseEvent = new CloseEvent(type);
			return newEvent;
		}
	}
}