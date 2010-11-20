package api.http.protocol
{
	import api.events.http.protocol.ProtocolEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_protocol.html Northcode Help Documentation
	*/
	public class Protocol extends Http
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>http</code>
		*/
		public var serverProtocol:String = "http";
		
		/**
		* Constructor for Http.Protocol()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_protocol.html Northcode Help Documentation
		*/
		public function Protocol(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_protocol.html Northcode Help Documentation
		*/
		public function protocol():void
		{
			ssCore.Http.protocol( {protocol:serverProtocol}
								 ,{callback:actionComplete, errorSTR:"protocolError", code:"4023"} );
		}
	}
}