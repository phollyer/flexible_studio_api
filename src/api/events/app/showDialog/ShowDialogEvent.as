package api.events.app.showDialog
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class ShowDialogEvent extends AppEvent
	{
		
    /**
    * The ShowDialogEvent.COMPLETE constant defines the value of the
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
    * The ShowDialogEvent.MISSING_HWND constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingHWND</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingHWND
    */
		public static const MISSING_HWND:String = "missingHWND";
		
		public function ShowDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowDialogEvent = new ShowDialogEvent( type );
			return e;
		}
	}
}