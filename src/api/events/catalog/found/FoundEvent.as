package api.events.catalog.found
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class FoundEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var rowNumber:Number = -1;
		
		public function FoundEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FoundEvent = new FoundEvent( type );
			e.rowNumber = rowNumber;
			return e;
		}
	}
}