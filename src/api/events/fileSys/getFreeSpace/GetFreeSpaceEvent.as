package api.events.fileSys.getFreeSpace
{
	import flash.events.Event;
	
	import api.events.fileSys.FileSysEvent;

	public class GetFreeSpaceEvent extends FileSysEvent
	{
		
	/**
	* The GetFreeSpaceEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var kilobytes:Number = -1;
		
		public function GetFreeSpaceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetFreeSpaceEvent = new GetFreeSpaceEvent( type );
			e.kilobytes = kilobytes;
			return e;
		}
	}
}