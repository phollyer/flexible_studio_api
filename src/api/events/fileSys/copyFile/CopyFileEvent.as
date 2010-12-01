package api.events.fileSys.copyFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CopyFileEvent extends FileSysEvent
	{
		
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