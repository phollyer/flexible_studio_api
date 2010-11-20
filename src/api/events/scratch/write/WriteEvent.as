package api.events.scratch.write
{
	import flash.events.Event;
	
	import api.events.scratch.ScratchEvent;

	public class WriteEvent extends ScratchEvent
	{
		
    /**
    * The WriteEvent.COMPLETE constant defines the value of the
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
    * The WriteEvent.MISSING_DATA constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>missingData</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * </table>
    *
    * @eventType missingData
    */
		public static const MISSING_DATA:String = "missingData";
		
		public function WriteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteEvent = new WriteEvent( type );
			return e;
		}
	}
}