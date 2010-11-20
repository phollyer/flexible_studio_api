package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnDesktopChangeEvent extends AppEvent
	{
		
    /**
    * The OnDesktopChangeEvent.CHANGE constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>change</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType change
    */
		public static const CHANGE:String = "change";
		
		public function OnDesktopChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnDesktopChangeEvent = new OnDesktopChangeEvent( type );
			return e;
		}
	}
}