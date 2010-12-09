package api.http.autoEncodeResource
{
	import api.events.http.autoEncodeResource.AutoEncodeResourceEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Canonicalizes the resource, which includes converting unsafe characters in the resource into escape sequences.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_autoEncodeResource.html Northcode Help Documentation
	*/
	public class AutoEncodeResource extends Http
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var flag:Boolean = false;
		
		/**
		* Constructor for Http.AutoEncodeResource()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_autoEncodeResource.html Northcode Help Documentation
		*/
		public function AutoEncodeResource(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Canonicalizes the resource, which includes converting unsafe characters in the resource into escape sequences.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_autoEncodeResource.html Northcode Help Documentation
		*/
		public function autoEncodeResource():void
		{
			ssCore.Http.autoEncodeResource( {flag:flag}
								 ,{callback:actionComplete, errorSTR:"autoEncodeResourceError", code:"4010"} );
		}
	}
}