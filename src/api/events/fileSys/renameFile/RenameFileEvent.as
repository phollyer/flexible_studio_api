package api.events.fileSys.renameFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RenameFileEvent extends FileSysEvent
	{
		
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