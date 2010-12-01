package api.events.fileSys.renameDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RenameDirEvent extends FileSysEvent
	{
		
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