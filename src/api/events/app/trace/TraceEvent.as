package api.events.app.trace
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class TraceEvent extends AppEvent
	{
		
    /**
    * The TraceEvent.COMPLETE constant defines the value of the
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
		
		public function TraceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TraceEvent = new TraceEvent( type );
			return e;
		}
	}
}