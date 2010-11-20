package api.events.catalog
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class CatalogEvent extends KernelEvent
	{
		public function CatalogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CatalogEvent = new CatalogEvent( type );
			return e;
		}
	}
}