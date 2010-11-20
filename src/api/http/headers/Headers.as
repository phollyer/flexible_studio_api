package api.http.headers
{
	import api.events.http.headers.HeadersEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>headers</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_HEADERS
	*/
	[Event(name="missingHeaders" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_headers.html Northcode Help Documentation
	*/
	public class Headers extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var headersList:Array = null;
		
		/**
		* Constructor for Http.Headers()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_headers.html Northcode Help Documentation
		*/
		public function Headers(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param headersArray
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_headers.html Northcode Help Documentation
		*/
		public function headers( headersArray:Array = null ):void
		{
			headersList = compareArrays( headersArray , headersList );
			
			switch( headersList )
			{
				case null:
					missingHeaders();
					break;
				default:
					var __headers:String = headersList.join( NEW_LINE ) + NEW_LINE;
					ssCore.Http.headers( {headers:__headers}
										,{callback:actionComplete, errorSTR:"headersError", code:"4017"} );
			}
		}
	}
}