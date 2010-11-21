package api.events.sysInfo.getProcessMemoryInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetProcessMemoryInfoEvent extends SysInfoEvent
	{
		/**
	* The GetProcessMemoryInfoEvent.RESULT constant defines the value of the
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
		
		public var totalMemoryUsed:Number = -1;
		
		public function GetProcessMemoryInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetProcessMemoryInfoEvent = new GetProcessMemoryInfoEvent( type );
			e.totalMemoryUsed = totalMemoryUsed;
			return e;
		}
	}
}