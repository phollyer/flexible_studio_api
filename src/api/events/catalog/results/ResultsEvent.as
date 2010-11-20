package api.events.catalog.results
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class ResultsEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var rows:Array = null;
		
		public function ResultsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResultsEvent = new ResultsEvent( type );
			e.rows = rows;
			return e;
		}
	}
}