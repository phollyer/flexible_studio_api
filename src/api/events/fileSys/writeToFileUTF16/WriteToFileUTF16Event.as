package api.events.fileSys.writeToFileUTF16
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class WriteToFileUTF16Event extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DATA:String = "missingData";
		public static const MISSING_PATH:String = "missingPath";
		
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