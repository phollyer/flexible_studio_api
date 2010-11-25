package api.events.catalog.browse
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class BrowseEvent extends CatalogEvent
	{
		
	/**
	* The BrowseEvent.RESULT constant defines the value of the
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
		
		public function BrowseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : BrowseEvent = new BrowseEvent( type );
			e.rows = rows;
			return e;
		}
	}
}