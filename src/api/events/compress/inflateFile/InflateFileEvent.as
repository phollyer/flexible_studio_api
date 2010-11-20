package api.events.compress.inflateFile
{
	import flash.events.Event;
	
	import api.events.compress.CompressEvent;

	public class InflateFileEvent extends CompressEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_SOURCE:String = "missingSource";
		
		public function InflateFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : InflateFileEvent = new InflateFileEvent( type );
			return e;
		}
	}
}