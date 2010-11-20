package api.events.ado.setConnectString
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class SetConnectStringEvent extends AdoEvent
	{
		
    /**
    * The SetConnectStringEvent.COMPLETE constant defines the value of the
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
    * The SetConnectStringEvent.MISSING_CONNECT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingConnectString</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingConnectString
    */
		public static const MISSING_CONNECT_STRING:String = "missingConnectString";
		
		public function SetConnectStringEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetConnectStringEvent = new SetConnectStringEvent( type );
			return e;
		}
	}
}