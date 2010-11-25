package api.events.binaryFile.close
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class CloseEvent extends BinaryFileEvent
	{
		
    /**
    * The CloseEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>systemError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";
		
		public var systemError:String = null;
		
		public function CloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : CloseEvent = new CloseEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}