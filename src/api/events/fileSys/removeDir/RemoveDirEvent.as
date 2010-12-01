package api.events.fileSys.removeDir
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class RemoveDirEvent extends FileSysEvent
	{
		
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