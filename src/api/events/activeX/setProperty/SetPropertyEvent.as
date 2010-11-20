package api.events.activeX.setProperty
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetPropertyEvent extends ActiveXEvent
	{
		
    /**
    * The SetPropertyEvent.COMPLETE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>complete</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType complete
    */
		public static const COMPLETE:String = "complete";
		
    /**
    * The SetPropertyEvent.MISSING_OBJECT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingObject</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingObject
    */
		public static const MISSING_OBJECT:String = "missingObject";
		
    /**
    * The SetPropertyEvent.MISSING_PROPERTY constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingProperty</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingProperty
    */
		public static const MISSING_PROPERTY:String = "missingProperty";
		
    /**
    * The SetPropertyEvent.MISSING_VALUE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingValue</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingValue
    */
		public static const MISSING_VALUE:String = "missingValue";
		
		public function SetPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPropertyEvent = new SetPropertyEvent( type );
			return e;
		}
	}
}