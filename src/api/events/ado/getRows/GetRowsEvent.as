package api.events.ado.getRows
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class GetRowsEvent extends AdoEvent
	{
		
    /**
    * The GetRowsEvent.RESULT constant defines the value of the
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
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The GetRowsEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>rows</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
		public var rows:String = null;
		
		public function GetRowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetRowsEvent = new GetRowsEvent( type );
			e.rows = rows;
			return e;
		}
	}
}