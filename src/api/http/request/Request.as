package api.http.request
{
	import api.events.http.request.RequestEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Allows you to provide data that should be sent with a POST request.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_request.html Northcode Help Documentation
	*/
	public class Request extends Http
	{
		// Required
		/**
		* Field/value pairs in URL encoded format.  Each field/value pair should be separated by a "&" character.  Do not include leading or trailing "&" characters in the request buffer.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Http.Request()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_request.html Northcode Help Documentation
		*/
		public function Request(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Allows you to provide data that should be sent with a POST request.
		*
		*
		* @param dataSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_request.html Northcode Help Documentation
		*/
		public function request( dataSTR:String = null ):void
		{
			data = compareStrings( dataSTR , data );
			
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Http.request( {data:data}
										,{callback:actionComplete, errorSTR:"requestError", code:"4028"} );
			}
		}
	}
}