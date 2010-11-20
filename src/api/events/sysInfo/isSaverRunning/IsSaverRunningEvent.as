package api.events.sysInfo.isSaverRunning
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class IsSaverRunningEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var isRunning:Boolean = false;
		
		public function IsSaverRunningEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsSaverRunningEvent = new IsSaverRunningEvent( type );
			e.isRunning = isRunning;
			return e;
		}
	}
}