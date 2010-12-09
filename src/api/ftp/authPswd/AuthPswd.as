package api.ftp.authPswd
{
	import api.events.ftp.authPswd.AuthPswdEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>pswd</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PSWD
	*/
	[Event(name="missingPswd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Set the password require to login to the FTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authPswd.html Northcode Help Documentation
	*/
	public class AuthPswd extends Ftp
	{
		// Required
		/**
		* The password require to login to the FTP server.
		*
		* @defaultValue <code>null</code>
		*/
		public var password:String = null;
		
		/**
		* Constructor for Ftp.AuthPswd()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authPswd.html Northcode Help Documentation
		*/
		public function AuthPswd(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the password require to login to the FTP server.
		*
		*
		* @param pswd
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_authPswd.html Northcode Help Documentation
		*/
		public function authPswd( pswd:String = null ):void
		{
			password = compareStrings( pswd , password );
			
			switch( password )
			{
				case null:
					missingPswd();
					break;
				default:
					ssCore.Ftp.authPswd( {password:password}
										,{callback:actionComplete, errorSTR:"authPswdError", code:"7005"} );
			}
		}
	}
}