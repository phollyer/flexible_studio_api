package api.events.ftp.removeDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class RemoveDirEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DIR_PATH:String = "missingDirPath";
		
		public function RemoveDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveDirEvent = new RemoveDirEvent( type );
			return e;
		}
	}
}