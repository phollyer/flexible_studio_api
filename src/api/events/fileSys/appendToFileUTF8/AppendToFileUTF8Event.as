package api.events.fileSys.appendToFileUTF8
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class AppendToFileUTF8Event extends FileSysEvent
	{
		
		public function AppendToFileUTF8Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppendToFileUTF8Event = new AppendToFileUTF8Event( type );
			return e;
		}
	}
}