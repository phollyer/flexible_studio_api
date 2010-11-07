package api.events.http.getDefaultProxyServer
{
	import flash.events.Event;
	
	import api.events.http.HttpEvent;

	public class GetDefaultProxyServerEvent extends HttpEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var server:String = null;
		
		public function GetDefaultProxyServerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultProxyServerEvent = new GetDefaultProxyServerEvent( type );
			e.server = server;
			return e;
		}
	}
}