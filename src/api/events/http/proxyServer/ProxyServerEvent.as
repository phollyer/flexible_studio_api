package api.events.http.proxyServer
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProxyServerEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_SERVER:String = "missingServer";
		
		public function ProxyServerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ProxyServerEvent = new ProxyServerEvent( type );
			return e;
		}
	}
}