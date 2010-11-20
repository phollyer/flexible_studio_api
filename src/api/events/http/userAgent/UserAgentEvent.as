package api.events.http.userAgent
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class UserAgentEvent extends HttpEvent
	{
		
		public function UserAgentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : UserAgentEvent = new UserAgentEvent( type );
			return e;
		}
	}
}