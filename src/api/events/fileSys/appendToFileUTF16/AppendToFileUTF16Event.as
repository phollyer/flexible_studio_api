package api.events.fileSys.appendToFileUTF16
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class AppendToFileUTF16Event extends FileSysEvent
	{
		
		public function AppendToFileUTF16Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppendToFileUTF16Event = new AppendToFileUTF16Event( type );
			return e;
		}
	}
}