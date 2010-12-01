package api.events.sysInfo.getMemoryInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetMemoryInfoEvent extends SysInfoEvent
	{
		/**
	* The GetMemoryInfoEvent.RESULT constant defines the value of the
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
		
		public var freePhysicalMemory:Number = -1;
		public var freeVirtualMemory:Number = -1;
		public var totalPhysicalMemory:Number = -1;
		public var totalVirtualMemory:Number = -1;
		
		public function GetMemoryInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetMemoryInfoEvent = new GetMemoryInfoEvent( type );
			return e;
		}
	}
}