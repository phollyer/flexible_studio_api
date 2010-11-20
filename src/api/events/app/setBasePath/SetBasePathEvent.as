package api.events.app.setBasePath
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SetBasePathEvent extends AppEvent
	{
		
    /**
    * The SetBasePathEvent.COMPLETE constant defines the value of the
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
    * The SetBasePathEvent.MISSING_PATH constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingPath</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingPath
    */
		public static const MISSING_PATH:String = "missingPath";
		
		public function SetBasePathEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetBasePathEvent = new SetBasePathEvent( type );
			return e;
		}
	}
}