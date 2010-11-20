package api.events.ado.moveBy
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MoveByEvent extends AdoEvent
	{
		
    /**
    * The MoveByEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * <tr><td>row</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The MoveByEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * <tr><td>row</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The MoveByEvent.MISSING_NUMBER constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingNumber</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * <tr><td>row</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingNumber
    */
		public static const MISSING_NUMBER:String = "missingNumber";
		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveByEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MoveByEvent = new MoveByEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}