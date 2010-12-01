package api.events.fileSys.writeToFileUTF8
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileUTF8Event extends FileSysEvent
	{
		
		public function WriteToFileUTF8Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteToFileUTF8Event = new WriteToFileUTF8Event( type );
			return e;
		}
	}
}