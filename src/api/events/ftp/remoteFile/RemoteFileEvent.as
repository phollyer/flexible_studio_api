package api.events.ftp.remoteFile
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class RemoteFileEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FILE:String = "missingFile";
		
		public function RemoteFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoteFileEvent = new RemoteFileEvent( type );
			return e;
		}
	}
}