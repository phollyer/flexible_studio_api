package api.events.activeX.isRegistered
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class IsRegisteredEvent extends ActiveXEvent
	{
		
    /**
    * The IsRegisteredEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>registered</td><td>false</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The IsRegisteredEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>registered</td><td>false</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The IsRegisteredEvent.MISSING_PROG constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingProgID</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>registered</td><td>false</td></tr>
    * 
    * </table>
    *
    * @eventType missingProgID
    */
		public static const MISSING_PROG_ID:String = "missingProgID";
		
		public var registered:Boolean = false;
		
		public function IsRegisteredEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsRegisteredEvent = new IsRegisteredEvent( type );
			e.registered = registered;
			return e;
		}
	}
}