package api.events.catalog.addPattern
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class AddPatternEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FIELD_NAME:String = "missingFieldName";
		public static const MISSING_PATTERN:String = "missingPattern";
		
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