package api.http.proxyUser
{
	import api.events.http.proxyUser.ProxyUserEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>user</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_USER
	*/
	[Event(name="missingUserID" , type="api.events.SWFStudioEvent")]
	[Event(name="missingUser", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Specify a user name for access to the proxy server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyUser.html Northcode Help Documentation
	*/
	public class ProxyUser extends Http
	{
		// Required
		/**
		* Name of a user with permission to access the proxy server (normally requires a password as well).
		*
		* @defaultValue <code>null</code>
		*/
		public var userID:String = null;
		
		/**
		* Constructor for Http.ProxyUser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyUser.html Northcode Help Documentation
		*/
		public function ProxyUser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Specify a user name for access to the proxy server.
		*
		*
		* @param username
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_proxyUser.html Northcode Help Documentation
		*/
		public function proxyUser( username:String = null ):void
		{
			userID = compareStrings( username , userID );
			
			switch( userID )
			{
				case null:
					missingUser();
					break;
				default:
					ssCore.Http.proxyUser( {userID:userID}
										  ,{callback:actionComplete, errorSTR:"proxyUserError", code:"4027"} );
			}
		}
	}
}