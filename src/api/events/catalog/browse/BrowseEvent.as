package api.events.catalog.browse
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class BrowseEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var rows:Array = null;
		
		public function BrowseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BrowseEvent = new BrowseEvent( type );
			e.rows = rows;
			return e;
		}
	}
}