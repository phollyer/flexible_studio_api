package api.events.sysInfo.getUserName
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetUserNameEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var userName:String = null;
		
		public function GetUserNameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetUserNameEvent = new GetUserNameEvent( type );
			e.userName = userName;
			return e;
		}
	}
}