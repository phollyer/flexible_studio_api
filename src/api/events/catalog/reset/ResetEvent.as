package api.events.catalog.reset
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class ResetEvent extends CatalogEvent
	{
		
		public function ResetEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResetEvent = new ResetEvent( type );
			return e;
		}
	}
}