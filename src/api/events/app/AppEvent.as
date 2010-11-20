package api.events.app
{
	import flash.events.Event;	
	import api.events.SWFStudioEvent;

	public class AppEvent extends SWFStudioEvent
	{
		
    /**
    * The AppEvent.LOGGING_OFF constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>loggingOff</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType loggingOff
    */
		public static const LOGGING_OFF:String = "loggingOff";
		
    /**
    * The AppEvent.REBOOTING constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>rebooting</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType rebooting
    */
		public static const REBOOTING:String = "rebooting";
		
    /**
    * The AppEvent.SHUTTING_DOWN constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>shuttingDown</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType shuttingDown
    */
		public static const SHUTTING_DOWN:String = "shuttingDown";
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AppEvent = new AppEvent(type);
			return e;
		}
	}
}