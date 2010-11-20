package api.events.fileSys.renameDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RenameDirEvent extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_NEW_NAME:String = "missingNewName";
		public static const MISSING_PATH:String = "missingPath";
		
		public function RenameDirEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RenameDirEvent = new RenameDirEvent( type );
			return e;
		}
	}
}