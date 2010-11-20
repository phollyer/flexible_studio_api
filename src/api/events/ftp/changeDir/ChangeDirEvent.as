package api.events.ftp.changeDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class ChangeDirEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
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