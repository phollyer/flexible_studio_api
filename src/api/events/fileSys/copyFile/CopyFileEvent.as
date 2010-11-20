package api.events.fileSys.copyFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CopyFileEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FROM_PATH:String = "missingFromPath";
		public static const MISSING_TO_PATH:String = "missingToPath";
		
		public function CopyFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			var e : CopyFileEvent = new CopyFileEvent( type );
			return e;
		}
	}
}