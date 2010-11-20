package api.events.compress.deflateFile
{
	import flash.events.Event;
	
	import api.events.compress.CompressEvent;

	public class DeflateFileEvent extends CompressEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_SOURCE:String = "missingSource";
		
		public function DeflateFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DeflateFileEvent = new DeflateFileEvent( type );
			return e;
		}
	}
}