package api.events.fileSys.deleteFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class DeleteFileEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function DeleteFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeleteFileEvent = new DeleteFileEvent( type );
			return e;
		}
	}
}