package api.events.fileSys.copyFileAsync
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CopyFileAsyncEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FROM_PATH:String = "missingFromPath";
		public static const MISSING_TO_PATH:String = "missingToPath";
		
		public function CopyFileAsyncEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CopyFileAsyncEvent = new CopyFileAsyncEvent( type );
			return e;
		}
	}
}