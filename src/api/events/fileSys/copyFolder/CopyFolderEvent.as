package api.events.fileSys.copyFolder
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CopyFolderEvent extends FileSysEvent
	{
		
		public function CopyFolderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CopyFolderEvent = new CopyFolderEvent( type );
			return e;
		}
	}
}