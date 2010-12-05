package api.http.getHeaders
{
	import api.events.http.getHeaders.GetHeadersEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getHeaders.GetHeadersEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getHeaders.GetHeadersEvent")]
	[Bindable]
	/**
	* Retrieve the raw HTTP headers returned from the server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getHeaders.html Northcode Help Documentation
	*/
	public class GetHeaders extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var headers:Array = null;
		
		/**
		* Constructor for Http.GetHeaders()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getHeaders.html Northcode Help Documentation
		*/
		public function GetHeaders(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the raw HTTP headers returned from the server.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getHeaders.html Northcode Help Documentation
		*/
		public function getHeaders():void
		{
			ssCore.Http.getHeaders( {}
								   ,{callback:actionComplete, errorSTR:"getHeadersError", code:"4015"} );
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
			headers = r.result.split( NEW_LINE );
			
			var e : GetHeadersEvent = new GetHeadersEvent( GetHeadersEvent.RESULT );
			e.headers = headers;
			dispatchEvent( e );
		}
	}
}