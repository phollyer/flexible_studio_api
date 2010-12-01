package api.events.catalog.addRange
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class AddRangeEvent extends CatalogEvent
	{
		
		public function AddRangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddRangeEvent = new AddRangeEvent ( type );
			return e;
		}
	}
}