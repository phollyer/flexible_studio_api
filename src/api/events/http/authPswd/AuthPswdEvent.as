package api.events.http.authPswd
{
	import flash.events.Event;
	
	import api.events.ftp.authPswd.AuthPswdEvent;
	import api.events.http.HttpEvent;

	public class AuthPswdEvent extends HttpEvent
	{
		
		public function AuthPswdEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AuthPswdEvent = new AuthPswdEvent( type );
			return e;
		}
	}
}