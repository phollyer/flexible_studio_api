package api.events.sysInfo.authenticateUser
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class AuthenticateUserEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PASSWORD:String = "missingPassword";
		public static const MISSING_USER:String = "missingUser";
		public static const RESULT:String = "result";
		
		public var verified:Boolean = false;
		
		public function AuthenticateUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AuthenticateUserEvent = new AuthenticateUserEvent( type );
			e.verified = verified;
			return e;
		}
	}
}