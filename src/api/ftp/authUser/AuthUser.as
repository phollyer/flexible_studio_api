package api.ftp.authUser
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingUserID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AuthUser extends Ftp
	{
		// Required
		public var userID:String = null;
		
		public function AuthUser(target:IEventDispatcher=null)
		{
			super(target);
		}
		
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