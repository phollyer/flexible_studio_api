package api.events.ftp.connect
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class ConnectEvent extends FtpEvent
	{
		
		public function ConnectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var newEvent:ConnectEvent = new ConnectEvent(type);
			return newEvent;
		}
	}
}