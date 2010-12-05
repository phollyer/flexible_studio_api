package api.ftp.getLastResponse
{
	import api.events.ftp.getLastResponse.GetLastResponseEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.getLastResponse.GetLastResponseEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.getLastResponse.GetLastResponseEvent")]
	[Bindable]
	/**
	* The last response from the FTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getLastResponse.html Northcode Help Documentation
	*/
	public class GetLastResponse extends Ftp
	{
		// Result 
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var serverResponse:String = null;
		
		/**
		* Constructor for Ftp.GetLastResponse()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getLastResponse.html Northcode Help Documentation
		*/
		public function GetLastResponse(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* The last response from the FTP server.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getLastResponse.html Northcode Help Documentation
		*/
		public function getLastResponse():void
		{
			ssCore.Ftp.getLastResponse( {}
									   ,{callback:actionComplete, errorSTR:"getLastResponseError", code:"7016"} );
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
			serverResponse = r.result;
			
			var e : GetLastResponseEvent = new GetLastResponseEvent( GetLastResponseEvent.RESULT );
			e.serverResponse = serverResponse;
			dispatchEvent( e );
		}
	}
}