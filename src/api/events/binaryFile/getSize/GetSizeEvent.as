package api.events.binaryFile.getSize
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class GetSizeEvent extends BinaryFileEvent
	{
		
    /**
    * The GetSizeEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>fileSize</td><td>0</td></tr>
    * 
    * <tr><td>systemError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";
		
		public var fileSize:Number = 0;
		public var systemError:String = null;
		
		public function GetSizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetSizeEvent = new GetSizeEvent( type );
			e.fileSize = fileSize;
			e.systemError = systemError;
			return e;
		}
	}
}