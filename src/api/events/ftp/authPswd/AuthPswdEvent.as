package api.events.ftp.authPswd
{
	import flash.events.Event;
	
	import api.events.ftp.FtpEvent;

	public class AuthPswdEvent extends FtpEvent
	{
		
		public function AuthPswdEvent( type:String , bubbles:Boolean = false , cancelable:Boolean = false )
		{
			super(type, bubbles , cancelable);
		}
		override public function clone():Event
		{
			var newEvent:AuthPswdEvent = new AuthPswdEvent(type);
			return newEvent;
		}		
	}
}