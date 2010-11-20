package api.events.catalog.maxRows
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class MaxRowsEvent extends CatalogEvent
	{
		
		public function MaxRowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MaxRowsEvent = new MaxRowsEvent( type );
			return e;
		}
	}
}