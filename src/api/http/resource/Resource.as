package api.http.resource
{
	import api.events.http.resource.ResourceEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>resource</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_RESOURCE
	*/
	[Event(name="missingResource" , type="api.events.SWFStudioEvent")]
	[Event(name="missingData", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Identifies the target of the HTTP request on the server identifed by HTTP.host. This could be a file you want to retrieve, a CGI script you want to execute, etc.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_resource.html Northcode Help Documentation
	*/
	public class Resource extends Http
	{
		// Required
		/**
		* The target of the HTTP request, assumed to be a relative reference from ("/") the root of the host.
		*
		* @defaultValue <code>null</code>
		*/
		public var resourceTarget:String = null;
		
		/**
		* Constructor for Http.Resource()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_resource.html Northcode Help Documentation
		*/
		public function Resource(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Identifies the target of the HTTP request on the server identifed by HTTP.host. This could be a file you want to retrieve, a CGI script you want to execute, etc.
		*
		*
		* @param resourceSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_resource.html Northcode Help Documentation
		*/
		public function resource( resourceSTR:String = null ):void
		{
			resourceTarget = compareStrings( resourceSTR , resourceTarget );
			
			switch( resourceTarget )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Http.resource( {resource:resourceTarget}
										 ,{callback:actionComplete, errorSTR:"resourceError", code:"4029"} );
			}
		}
	}
}