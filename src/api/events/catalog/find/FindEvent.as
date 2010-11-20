package api.events.catalog.find
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class FindEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function FindEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FindEvent = new FindEvent( type );
			return e;
		}
	}
}