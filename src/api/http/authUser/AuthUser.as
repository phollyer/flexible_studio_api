package api.http.authUser
{
	import api.events.http.authUser.AuthUserEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>user</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_USER
	*/
	[Event(name="missingUser" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Sets the password to be automatically supplied when trying to access protected sites.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authUser.html Northcode Help Documentation
	*/
	public class AuthUser extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var userID:String = null;
		
		/**
		* Constructor for Http.AuthUser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authUser.html Northcode Help Documentation
		*/
		public function AuthUser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Sets the password to be automatically supplied when trying to access protected sites.
		*
		*
		* @param username
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_authUser.html Northcode Help Documentation
		*/
		public function authUser( username:String = null ):void
		{
			userID = compareStrings( username , userID )
			switch( userID )
			{
				case null:
					missingUser();
					break;
				default:
					ssCore.Http.authUser( {userID:userID}
										 ,{callback:actionComplete, errorSTR:"authUserError", code:"4009"} );
			}
		}
	}
}