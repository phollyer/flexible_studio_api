package api.events.fileSys.appendToFile
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class AppendToFileEvent extends FileSysEvent
	{
		
		public function AppendToFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppendToFileEvent = new AppendToFileEvent( type );
			return e;
		}
	}
}