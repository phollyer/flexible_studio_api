package api.http.authUser
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingUser" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AuthUser extends Http
	{
		// Required
		public var userID:String = null;
		
		public function AuthUser(target:IEventDispatcher=null)
		{
			super(target);
		}
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