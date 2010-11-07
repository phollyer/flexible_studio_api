package api.events.catalog.rowCount
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class RowCountEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var rowTotal:Number = -1;
		
		public function RowCountEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RowCountEvent = new RowCountEvent( type );
			e.rowTotal = rowTotal;
			return e;
		}
	}
}