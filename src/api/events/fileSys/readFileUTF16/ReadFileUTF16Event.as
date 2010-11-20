package api.events.fileSys.readFileUTF16
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class ReadFileUTF16Event extends FileSysEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function ReadFileUTF16Event(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadFileUTF16Event = new ReadFileUTF16Event( type );
			e.data = data;
			return e;
		}
	}
}