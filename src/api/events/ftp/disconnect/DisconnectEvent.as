package api.events.ftp.disconnect
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class DisconnectEvent extends FtpEvent
	{
		
		public function DisconnectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:DisconnectEvent = new DisconnectEvent(type);
			return newEvent;
		}
	}
}