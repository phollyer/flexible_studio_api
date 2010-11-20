package api.events.catalog.addPattern
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class AddPatternEvent extends CatalogEvent
	{
		
		public function AddPatternEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddPatternEvent = new AddPatternEvent( type );
			return e;
		}
	}
}