package api.events.ftp.getDirList
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class GetDirListEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var dirList:Array = null;
		
		public function GetDirListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDirListEvent = new GetDirListEvent( type );
			e.dirList = dirList;
			return e;
		}
	}
}