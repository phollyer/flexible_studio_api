package api.events.sysInfo.getProcessMemoryInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetProcessMemoryInfoEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
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