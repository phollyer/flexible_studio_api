package api.events.sysInfo.getEnv
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetEnvEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_VARIABLE:String = "missingVariable";
		public static const RESULT:String = "result";
		
		public var value:String = null;
		
		public function GetEnvEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetEnvEvent = new GetEnvEvent( type );
			e.value = value;
			return e;
		}
	}
}