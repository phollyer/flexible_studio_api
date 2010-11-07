package api.events.scratch.read
{
	import flash.events.Event;
	
	import api.events.scratch.ScratchEvent;

	public class ReadEvent extends ScratchEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function ReadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadEvent = new ReadEvent( type );
			e.data = data;
			return e;
		}
	}
}