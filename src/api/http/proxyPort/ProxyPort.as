package api.http.proxyPort
{
	import api.events.http.proxyPort.ProxyPortEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>port</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PORT
	*/
	[Event(name="missingPort" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Select the port to be used for communications with the proxy server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPort.html Northcode Help Documentation
	*/
	public class ProxyPort extends Http
	{
		// Required
		/**
		* The port number of the proxy server to use for requests (depends on your proxy server configuration).
		*
		* @defaultValue <code>null</code>
		*/
		public var port:String = null;
		
		/**
		* Constructor for Http.ProxyPort()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPort.html Northcode Help Documentation
		*/
		public function ProxyPort(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Select the port to be used for communications with the proxy server.
		*
		*
		* @param portSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPort.html Northcode Help Documentation
		*/
		public function proxyPort( portSTR:String = null ):void
		{
			port = compareStrings( portSTR , port );
			
			switch( port )
			{
				case null:
					missingPort();
					break;
				default:
					ssCore.Http.proxyPort( {port:port}
										  ,{callback:actionComplete, errorSTR:"proxyPortError", code:"4024"} );
			}
		}
	}
}