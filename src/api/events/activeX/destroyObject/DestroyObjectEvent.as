package api.events.activeX.destroyObject
{
	import flash.events.Event;
	
	import api.events.activeX.ActiveXEvent;

	public class DestroyObjectEvent extends ActiveXEvent
	{
		
    /**
    * The DestroyObjectEvent.COMPLETE constant defines the value of the
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
    * The DestroyObjectEvent.MISSING_OBJECT constant defines the value of the
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
		
		public function DestroyObjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : DestroyObjectEvent = new DestroyObjectEvent( type );
			return e;
		}
	}
}