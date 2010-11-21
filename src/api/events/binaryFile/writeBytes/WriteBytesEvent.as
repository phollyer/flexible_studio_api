package api.events.binaryFile.writeBytes
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class WriteBytesEvent extends BinaryFileEvent
	{
		/**
    * The WriteBytesEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>bytesWritten</td><td>0</td></tr>
    * 
    * <tr><td>systemError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";
		
		public var bytesWritten:Number = 0;
		public var systemError:String = null;
		
		public function WriteBytesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : WriteBytesEvent = new WriteBytesEvent( type );
			e.bytesWritten = bytesWritten;
			e.systemError = systemError;
			return e;
		}
	}
}