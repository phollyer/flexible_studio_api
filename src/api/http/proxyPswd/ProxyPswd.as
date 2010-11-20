package api.http.proxyPswd
{
	import api.events.http.proxyPswd.ProxyPswdEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>pswd</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PSWD
	*/
	[Event(name="missingPswd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPswd.html Northcode Help Documentation
	*/
	public class ProxyPswd extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var password:String = null;
		
		/**
		* Constructor for Http.ProxyPswd()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPswd.html Northcode Help Documentation
		*/
		public function ProxyPswd(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param pswd
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyPswd.html Northcode Help Documentation
		*/
		public function proxyPswd( pswd:String = null ):void
		{
			password = compareStrings( pswd , password );
			
			switch( password )
			{
				case null:
					missingPswd();
					break;
				default:
					ssCore.Http.proxyPswd( {password:password}
										  ,{callback:actionComplete, errorSTR:"proxyPswdError", code:"4025"} );
			}
		}
	}
}