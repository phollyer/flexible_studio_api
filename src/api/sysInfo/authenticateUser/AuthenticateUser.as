package api.sysInfo.authenticateUser
{
	import api.events.sysInfo.authenticateUser.AuthenticateUserEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>password</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PASSWORD
	*/
	[Event(name="missingPassword" , type="api.events.SWFStudioEvent")]
	[Event(name="missingUser" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.authenticateUser.AuthenticateUserEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.authenticateUser.AuthenticateUserEvent")]
	[Bindable]
	/**
	* Return a true/false value that indicates whether the supplied user credentials are valid or not for the specified domain. If a domain is not supplied, the user will be authenticated against the local machine user database.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_authenticateUser.html Northcode Help Documentation
	*/
	public class AuthenticateUser extends SysInfo
	{
		// Optional
		public var domain:String= null;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var password:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var user:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var verified:Boolean = false;
		
		/**
		* Constructor for SysInfo.AuthenticateUser()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_authenticateUser.html Northcode Help Documentation
		*/
		public function AuthenticateUser(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Return a true/false value that indicates whether the supplied user credentials are valid or not for the specified domain. If a domain is not supplied, the user will be authenticated against the local machine user database.
		*
		*
		* @param username
		*
		* @param pswd
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_authenticateUser.html Northcode Help Documentation
		*/
		public function authenticateUser( username:String = null , pswd:String = null ):void
		{
			user = compareStrings( username , user );
			password = compareStrings( pswd , password );
			
			switch( user )
			{
				case null:
					missingUser();
					break;
				default:
					switch( password )
					{
						case null:
							missingPassword();
							break;
						default:
							var __o:Object = new Object();
							__o.password = password;
							__o.user = user;
							
							switch( domain != null )
							{
								case true:
									__o.domain = domain;
							}
							
							ssCore.SysInfo.authenticateUser( __o
														   ,{callback:actionComplete, errorSTR:"authenticateUserError", code:"38000"} );
					}
			}
		}

		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			verified = checkBoolean( r.result );
			
			var e : AuthenticateUserEvent = new AuthenticateUserEvent( AuthenticateUserEvent.RESULT );
			e.verified = verified;
			dispatchEvent( e );
		}
	}
}