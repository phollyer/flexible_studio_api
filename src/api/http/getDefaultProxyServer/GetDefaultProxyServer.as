package api.http.getDefaultProxyServer
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.http.getDefaultProxyServer.GetDefaultProxyServerEvent;
	import api.http.Http;

	[Event(name="result", type="api.events.http.getDefaultProxyServer.GetDefaultProxyServerEvent")]
	[Bindable]
	public class GetDefaultProxyServer extends Http
	{
		// Result
		public var server:String = null;
		
		public function GetDefaultProxyServer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDefaultProxyServer():void
		{
			ssCore.Http.getDefaultProxyServer( {}
								  			,{callback:actionComplete, errorSTR:"getDefaultProxyServerError", code:"4014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			server = r.result;
			
			var e : GetDefaultProxyServerEvent = new GetDefaultProxyServerEvent( GetDefaultProxyServerEvent.RESULT );
			e.server = server;
			dispatchEvent( e );
		}
	}
}