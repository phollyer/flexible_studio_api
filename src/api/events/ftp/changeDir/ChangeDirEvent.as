package api.events.ftp.changeDir
{
	import api.events.ftp.FtpEvent;
	
	import flash.events.Event;

	public class ChangeDirEvent extends FtpEvent
	{
		public static const INVALID_PATH:String = "invalidPath"
		
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