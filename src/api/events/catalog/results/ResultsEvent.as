package api.events.catalog.results
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class ResultsEvent extends CatalogEvent
	{
		
	/**
	* The ResultsEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>rows</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var rows:Array = null;
		
		public function ResultsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ResultsEvent = new ResultsEvent( type );
			e.rows = rows;
			return e;
		}
	}
}