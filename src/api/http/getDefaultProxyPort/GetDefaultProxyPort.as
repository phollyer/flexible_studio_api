package api.http.getDefaultProxyPort
{
	import api.events.http.getDefaultProxyPort.GetDefaultProxyPortEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getDefaultProxyPort.GetDefaultProxyPortEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getDefaultProxyPort.GetDefaultProxyPortEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyPort.html Northcode Help Documentation
	*/
	public class GetDefaultProxyPort extends Http
	{
		// Result
		public var portNumber:Number = -1;
		
		/**
		* Constructor for Http.GetDefaultProxyPort()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyPort.html Northcode Help Documentation
		*/
		public function GetDefaultProxyPort(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getDefaultProxyPort.html Northcode Help Documentation
		*/
		public function getDefaultProxyPort():void
		{
			ssCore.Http.getDefaultProxyPort( {}
								  			,{callback:actionComplete, errorSTR:"getDefaultProxyPortError", code:"4013"} );
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
			portNumber = r.result;
			
			var e : GetDefaultProxyPortEvent = new GetDefaultProxyPortEvent( GetDefaultProxyPortEvent.RESULT );
			e.portNumber = portNumber;
			dispatchEvent( e );
		}
	}
}