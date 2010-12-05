package api.http.authPswd
{
	import api.events.http.authPswd.AuthPswdEvent;

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
	* Sets the password to be automatically supplied when trying to access protected sites.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authPswd.html Northcode Help Documentation
	*/
	public class AuthPswd extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var password:String = null;
		
		/**
		* Constructor for Http.AuthPswd()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authPswd.html Northcode Help Documentation
		*/
		public function AuthPswd(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Sets the password to be automatically supplied when trying to access protected sites.
		*
		*
		* @param pswd
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authPswd.html Northcode Help Documentation
		*/
		public function authPswd( pswd:String = null ):void
		{
			password = compareStrings( pswd , password )
			switch( password )
			{
				case null:
					missingPswd();
					break;
				default:
					ssCore.Http.authPswd( {password:password}
										 ,{callback:actionComplete, errorSTR:"authPswdError", code:"4008"} );
			}
		}
	}
}