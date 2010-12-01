package api.events.fileSys.writeToFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileEvent extends FileSysEvent
	{
		
		public function WriteToFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteToFileEvent = new WriteToFileEvent( type );
			return e;
		}
	}
}