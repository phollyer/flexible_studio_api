package api.http.getLastResponse
{
	import api.events.http.getLastResponse.GetLastResponseEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.http.getLastResponse.GetLastResponseEvent.RESULT
	*/
	[Event(name="result", type="api.events.http.getLastResponse.GetLastResponseEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getLastResponse.html Northcode Help Documentation
	*/
	public class GetLastResponse extends Http
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var statusCode:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var statusDetails:String = null;
		
		/**
		* Constructor for Http.GetLastResponse()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getLastResponse.html Northcode Help Documentation
		*/
		public function GetLastResponse(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_getLastResponse.html Northcode Help Documentation
		*/
		public function getLastResponse():void
		{
			ssCore.Http.getLastResponse( {}
								  		,{callback:actionComplete, errorSTR:"getLastResponseError", code:"4016"} );
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
			statusCode = r.result;
			statusDetails = r.details;
			
			var e : GetLastResponseEvent = new GetLastResponseEvent( GetLastResponseEvent.RESULT );
			e.statusCode = statusCode;
			e.statusDetails = statusDetails;
			dispatchEvent( e );
		}
	}
}