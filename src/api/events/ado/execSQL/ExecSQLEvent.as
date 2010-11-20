package api.events.ado.execSQL
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class ExecSQLEvent extends AdoEvent
	{
		
    /**
    * The ExecSQLEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The ExecSQLEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The ExecSQLEvent.MISSING_SQL constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingSQL</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingSQL
    */
		public static const MISSING_SQL:String = "missingSQL";
		
		public var adoError:String = null;
		
		public function ExecSQLEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ExecSQLEvent = new ExecSQLEvent( type );
			e.adoError = adoError;
			return e;
		}
	}
}