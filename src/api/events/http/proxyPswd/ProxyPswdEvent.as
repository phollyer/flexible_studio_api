package api.events.http.proxyPswd
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProxyPswdEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PSWD:String = "missingPswd";
		
		public function ProxyPswdEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ProxyPswdEvent = new ProxyPswdEvent( type );
			return e;
		}
	}
}