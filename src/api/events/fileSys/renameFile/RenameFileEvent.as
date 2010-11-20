package api.events.fileSys.renameFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RenameFileEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NEW_NAME:String = "missingNewName";
		public static const MISSING_PATH:String = "missingPath";
		
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