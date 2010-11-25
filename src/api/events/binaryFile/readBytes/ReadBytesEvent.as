package api.events.binaryFile.readBytes
{
	import api.events.binaryFile.BinaryFileEvent;
	
	import flash.events.Event;

	public class ReadBytesEvent extends BinaryFileEvent
	{
		
    /**
    * The ReadBytesEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>bytesRead</td><td>0</td></tr>
    * 
    * <tr><td>systemError</td><td>null</td></tr>
    * 
    * <tr><td>text</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
    	public static const INVALID_FORMAT:String = "invalidFormat";
    	public static const INVALID_SIZE:String = "invalidSize";
		public static const RESULT:String = "result";
		
		public var bytesRead:Number = 0;
		public var systemError:String = null;
		public var text:String = null;
		
		public function ReadBytesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ReadBytesEvent = new ReadBytesEvent( type );
			e.bytesRead = bytesRead;
			e.systemError = systemError;
			e.text = text;
			return e;
		}
	}
}