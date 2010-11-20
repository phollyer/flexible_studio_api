package api.events.ftp.changeDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class ChangeDirEvent extends FtpEvent
	{
		
		public function ChangeDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ChangeDirEvent = new ChangeDirEvent( type );
			return e;
		}
	}
}