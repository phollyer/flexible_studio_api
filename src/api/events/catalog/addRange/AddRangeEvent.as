package api.events.catalog.addRange
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class AddRangeEvent extends CatalogEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_FIELD_NAME:String = "missingFieldName";
		public static const MISSING_HIGH_VALUE:String = "missingHighValue";
		public static const MISSING_LOW_VALUE:String = "missingLowValue";
		
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