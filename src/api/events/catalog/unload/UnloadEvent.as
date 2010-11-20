package api.events.catalog.unload
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class UnloadEvent extends CatalogEvent
	{
		
		public function UnloadEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UnloadEvent = new UnloadEvent( type );
			return e;
		}
	}
}