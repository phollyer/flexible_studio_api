package api.events.catalog.found
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class FoundEvent extends CatalogEvent
	{
		
	/**
	* The FoundEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var rowNumber:Number = -1;
		
		public function FoundEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FoundEvent = new FoundEvent( type );
			e.rowNumber = rowNumber;
			return e;
		}
	}
}