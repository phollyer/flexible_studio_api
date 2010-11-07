package api.events.sysInfo.getCPUSpeed
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetCPUSpeedEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var speed:Number = -1;
		
		public function GetCPUSpeedEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetCPUSpeedEvent = new GetCPUSpeedEvent( type );
			e.speed = speed;
			return e;
		}
	}
}