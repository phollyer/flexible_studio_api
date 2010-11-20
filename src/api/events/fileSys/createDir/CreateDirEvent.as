package api.events.fileSys.createDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CreateDirEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DIR_PATH:String = "missingDirPath";
		
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