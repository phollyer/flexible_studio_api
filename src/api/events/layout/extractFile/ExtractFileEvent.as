package api.events.layout.extractFile
{
	import flash.events.Event;
	
	import api.events.layout.LayoutEvent;

	public class ExtractFileEvent extends LayoutEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_DESTINATION:String = "missingDestination";
		public static const MISSING_RESOURCE:String = "missingResource";		
		
		public function ExtractFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExtractFileEvent = new ExtractFileEvent( type );
			return e;
		}
	}
}