package api.http.method
{
	import api.events.http.method.MethodEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>method</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_METHOD
	*/
	[Event(name="missingMethod" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Tells the plugin which method to use when submitting your request to the HTTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_method.html Northcode Help Documentation
	*/
	public class Method extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var requestMethod:String = null;
		
		/**
		* Constructor for Http.Method()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_method.html Northcode Help Documentation
		*/
		public function Method(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Tells the plugin which method to use when submitting your request to the HTTP server.
		*
		*
		* @param methodSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_method.html Northcode Help Documentation
		*/
		public function method( methodSTR:String = null ):void
		{
			requestMethod = compareStrings( methodSTR , requestMethod );
			
			switch( requestMethod )
			{
				case null:
					missingMethod();
					break;
				default:
					ssCore.Http.method( {method:requestMethod}
									  ,{callback:actionComplete, errorSTR:"methodError", code:"4020"} );
			}
		}
	}
}