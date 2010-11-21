package api.events.catalog.fields
{
	import flash.events.Event;
	
	import api.events.catalog.CatalogEvent;

	public class FieldsEvent extends CatalogEvent
	{
		/**
	* The FieldsEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>fieldList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var fieldList:Array = null;
		
		public function FieldsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : FieldsEvent = new FieldsEvent( type );
			e.fieldList = fieldList;
			return e;
		}
	}
}