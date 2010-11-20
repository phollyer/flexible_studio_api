package api.events.fileSys.writeToFileBinary
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileBinaryEvent extends FileSysEvent
	{
		
		public function WriteToFileBinaryEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteToFileBinaryEvent = new WriteToFileBinaryEvent( type );
			return e;
		}
	}
}