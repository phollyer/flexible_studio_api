package api.http.proxyServer
{
	import api.events.http.proxyServer.ProxyServerEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>server</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_SERVER
	*/
	[Event(name="missingServer" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyServer.html Northcode Help Documentation
	*/
	public class ProxyServer extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var server:String = null;
		
		/**
		* Constructor for Http.ProxyServer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyServer.html Northcode Help Documentation
		*/
		public function ProxyServer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param serverSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyServer.html Northcode Help Documentation
		*/
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