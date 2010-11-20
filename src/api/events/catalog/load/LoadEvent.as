package api.events.catalog.load
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class LoadEvent extends CatalogEvent
	{
		
		public function LoadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : LoadEvent = new LoadEvent( type );
			return e;
		}
	}
}