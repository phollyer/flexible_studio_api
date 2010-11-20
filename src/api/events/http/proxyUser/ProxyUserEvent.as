package api.events.http.proxyUser
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class ProxyUserEvent extends HttpEvent
	{
		
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