package api.events.sysInfo.isUserAnAdmin
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class IsUserAnAdminEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var isAdmin:Boolean = false;
		
		public function IsUserAnAdminEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : IsUserAnAdminEvent = new IsUserAnAdminEvent( type );
			e.isAdmin = isAdmin;
			return e;
		}
	}
}