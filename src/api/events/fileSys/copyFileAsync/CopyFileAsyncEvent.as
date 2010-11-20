package api.events.fileSys.copyFileAsync
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class CopyFileAsyncEvent extends FileSysEvent
	{
		
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