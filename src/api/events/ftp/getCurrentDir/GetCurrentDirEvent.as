package api.events.ftp.getCurrentDir
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetCurrentDirEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var currentDir:String = null;
		
		public function GetCurrentDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCurrentDirEvent = new GetCurrentDirEvent( type );
			e.currentDir = currentDir;
			return e;
		}
	}
}