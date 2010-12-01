package api.events.fileSys.appendToFileBinary
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class AppendToFileBinaryEvent extends FileSysEvent
	{
		
		public function AppendToFileBinaryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppendToFileBinaryEvent = new AppendToFileBinaryEvent( type );
			return e;
		}
	}
}