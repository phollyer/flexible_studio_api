package api.events.activeX.notifiers
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class SetNotifyEvent extends ActiveXEvent
	{
		
    /**
    * The SetNotifyEvent.STATUS constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>status</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>result</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType status
    */
		public static const STATUS:String = "status";
		
    /**
    * The SetNotifyEvent.MISSING_EVENT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingEvent</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>result</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingEvent
    */
		public static const MISSING_EVENT:String = "missingEvent";
		
    /**
    * The SetNotifyEvent.MISSING_OBJECT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingObject</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>result</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType missingObject
    */
		public static const MISSING_OBJECT:String = "missingObject";
		
		public var result:Array = null;
		
		public function SetNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetNotifyEvent = new SetNotifyEvent( type );
			e.result = result;
			return e;
		}
	}
}