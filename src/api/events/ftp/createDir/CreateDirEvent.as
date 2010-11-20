package api.events.ftp.createDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class CreateDirEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function CreateDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CreateDirEvent = new CreateDirEvent( type );
			return e;
		}
	}
}