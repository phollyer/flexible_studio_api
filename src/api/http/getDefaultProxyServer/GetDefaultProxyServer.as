package api.http.getDefaultProxyServer
{
	import api.events.http.getDefaultProxyServer.GetDefaultProxyServerEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getDefaultProxyServer.GetDefaultProxyServerEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getDefaultProxyServer.GetDefaultProxyServerEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyServer.html Northcode Help Documentation
	*/
	public class GetDefaultProxyServer extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var server:String = null;
		
		/**
		* Constructor for Http.GetDefaultProxyServer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyServer.html Northcode Help Documentation
		*/
		public function GetDefaultProxyServer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyServer.html Northcode Help Documentation
		*/
		public function getDefaultProxyServer():void
		{
			ssCore.Http.getDefaultProxyServer( {}
								  			,{callback:actionComplete, errorSTR:"getDefaultProxyServerError", code:"4014"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			server = r.result;
			
			var e : GetDefaultProxyServerEvent = new GetDefaultProxyServerEvent( GetDefaultProxyServerEvent.RESULT );
			e.server = server;
			dispatchEvent( e );
		}
	}
}