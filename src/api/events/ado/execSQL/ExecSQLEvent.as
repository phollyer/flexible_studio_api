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
		public static const RESULT:String = "result";		
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