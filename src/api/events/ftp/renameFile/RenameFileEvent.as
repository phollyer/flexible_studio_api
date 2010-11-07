package api.events.ftp.renameFile
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class RenameFileEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_EXISTING_FILE:String = "missingExistingFile";
		public static const MISSING_NEW_FILE:String = "missingNewFile";
		
		public function RenameFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RenameFileEvent = new RenameFileEvent( type );
			return e;
		}
	}
}