package api.events.activeX.getProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class GetPropertyEvent extends ActiveXEvent
	{
		
    /**
    * The GetPropertyEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>propertyVal</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT : String = "result";
		public static const RESULT:String = "result";
		
    /**
    * The GetPropertyEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>propertyVal</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The GetPropertyEvent.MISSING_OBJECT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingObject</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>propertyVal</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingObject
    */
		public static const MISSING_OBJECT:String = "missingObject";
		
    /**
    * The GetPropertyEvent.MISSING_PROPERTY constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingProperty</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>propertyVal</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingProperty
    */
		public static const MISSING_PROPERTY:String = "missingProperty";
		
		public var propertyVal:Object = null;
		
		public function GetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPropertyEvent = new GetPropertyEvent( type );
			e.propertyVal = propertyVal;
			return e;
		}
	}
}