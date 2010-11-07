package api.events.http.proxyPort
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProxyPortEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_PORT:String = "missingPort";
		
		public function ProxyPortEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ProxyPortEvent = new ProxyPortEvent( type );
			return e;
		}
	}
}