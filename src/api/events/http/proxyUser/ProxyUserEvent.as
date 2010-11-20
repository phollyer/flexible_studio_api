package api.events.http.proxyUser
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProxyUserEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_USER_ID:String = "missingUserID";
		
		public function ProxyUserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ProxyUserEvent = new ProxyUserEvent( type );
			return e;
		}
	}
}