package api.events.app.forceExitWindows
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ForceExitWindowsEvent extends AppEvent
	{
		
    /**
    * The ForceExitWindowsEvent.COMPLETE constant defines the value of the
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
    * The ForceExitWindowsEvent.MISSING_METHOD constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingMethod</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingMethod
    */
		public static const MISSING_METHOD:String = "missingMethod";
		
		public function ForceExitWindowsEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ForceExitWindowsEvent = new ForceExitWindowsEvent( type );
			return e;
		}
	}
}