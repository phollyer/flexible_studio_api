package api.events.binaryFile.getFilePointer
{
	import flash.events.Event;
	
	import api.events.binaryFile.BinaryFileEvent;

	public class GetFilePointerEvent extends BinaryFileEvent
	{
		/**
    * The GetFilePointerEvent.RESULT constant defines the value of the
    * <code>type</code> property of the event object
    * for a <code>result</code> event.
    *
    * <p>The properties of the event object have the following values:</p>
    * <table class=innertable>
    * <tr><th>Property</th><th>Value</th></tr>
    * 
    * <tr><td>pointerIndex</td><td>0</td></tr>
    * 
    * <tr><td>systemError</td><td>null</td></tr>
    * 
    * </table>
    *
    * @eventType result
    */
		public static const RESULT:String = "result";
		
		public var pointerIndex:Number = 0;
		public var systemError:String = null;
		
		public function GetFilePointerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFilePointerEvent = new GetFilePointerEvent( type );
			e.pointerIndex = pointerIndex;
			e.systemError = systemError;
			return e;
		}
	}
}