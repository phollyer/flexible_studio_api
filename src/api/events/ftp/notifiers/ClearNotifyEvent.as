package api.events.ftp.notifiers
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class ClearNotifyEvent extends FtpEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}