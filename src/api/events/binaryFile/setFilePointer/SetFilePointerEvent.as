package api.events.binaryFile.setFilePointer
{
	import api.events.binaryFile.BinaryFileEvent;
	
	import flash.events.Event;

	public class SetFilePointerEvent extends BinaryFileEvent
	{
		
    /**
    * The SetFilePointerEvent.RESULT constant defines the value of the
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
    	public static const INVALID_POINTER:String = "invalidPointer";
		public static const RESULT:String = "result";
		
		public var systemError:String = null;
		
		public function SetFilePointerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetFilePointerEvent = new SetFilePointerEvent( type );
			e.systemError = systemError;
			return e;
		}
	}
}