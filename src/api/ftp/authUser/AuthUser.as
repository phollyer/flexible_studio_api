package api.ftp.authUser
{
	import api.events.ftp.authUser.AuthUserEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>userID</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_USER_ID
	*/
	[Event(name="missingUserID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authUser.html Northcode Help Documentation
	*/
	public class AuthUser extends Ftp
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var userID:String = null;
		
		/**
		* Constructor for Ftp.AuthUser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authUser.html Northcode Help Documentation
		*/
		public function AuthUser(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param username
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authUser.html Northcode Help Documentation
		*/
		public function authUser( username:String = null ):void
		{			
			userID = compareStrings( username , userID );
			
			switch( userID )
			{
				case null:
					missingUserID();
					break;
				default:
					ssCore.Ftp.authUser( {userID:userID}
										,{callback:actionComplete, errorSTR:"authUserError", code:"7006"} );
			}
		}
	}
}