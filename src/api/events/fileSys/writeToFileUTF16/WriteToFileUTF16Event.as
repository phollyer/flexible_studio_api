package api.events.fileSys.writeToFileUTF16
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileUTF16Event extends FileSysEvent
	{
		
		public function WriteToFileUTF16Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteToFileUTF16Event = new WriteToFileUTF16Event( type );
			return e;
		}
	}
}