package api.events.ado.movePrevious
{
	import flash.events.Event;
	
	import api.events.ado.AdoEvent;

	public class MovePreviousEvent extends AdoEvent
	{
		/**
    * The MovePreviousEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>adoError</td><td>null</td></tr>
    * 
    * <tr><td>row</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";		
		public var adoError:String = null;
		public var row:String = null;
		
		public function MovePreviousEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MovePreviousEvent = new MovePreviousEvent( type );
			e.adoError = adoError;
			e.row = row;
			return e;
		}
	}
}