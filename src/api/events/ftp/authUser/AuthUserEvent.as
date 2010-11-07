package api.events.ftp.authUser
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class AuthUserEvent extends FtpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_USER_ID:String = "missingUserID";
		
		public function AuthUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:AuthUserEvent = new AuthUserEvent(type);
			return newEvent;
		}
	}
}