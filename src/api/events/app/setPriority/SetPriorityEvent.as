package api.events.app.setPriority
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SetPriorityEvent extends AppEvent
	{
		
    /**
    * The SetPriorityEvent.INVALID_PRIORITY constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>invalidPriority</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType invalidPriority
    */
		public static const INVALID_PRIORITY:String = "invalidPriority";
		
    /**
    * The SetPriorityEvent.COMPLETE constant defines the value of the
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
		
		public function SetPriorityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPriorityEvent = new SetPriorityEvent( type );
			return e;
		}
	}
}