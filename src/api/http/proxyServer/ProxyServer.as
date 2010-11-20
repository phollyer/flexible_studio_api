package api.http.proxyServer
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingServer" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ProxyServer extends Http
	{
		// Required
		public var server:String = null;
		
		public function ProxyServer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function proxyServer( serverSTR:String = null ):void
		{
			server = compareStrings( serverSTR , server );
			
			switch( server )
			{
				case null:
					missingServer();
					break;
				default:
					ssCore.Http.proxyServer( {server:server}
										    ,{callback:actionComplete, errorSTR:"proxyServerError", code:"4026"} );
			}
		}
	}
}