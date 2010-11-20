package api.events.fileSys.removeDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RemoveDirEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
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