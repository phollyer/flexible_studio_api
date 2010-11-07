package api.events.http.authUser
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class AuthUserEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function AuthUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AuthUserEvent = new AuthUserEvent( type );
			return e;
		}
	}
}