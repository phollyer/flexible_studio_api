package api.http.proxyUser
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingUserID" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ProxyUser extends Http
	{
		// Required
		public var userID:String = null;
		
		public function ProxyUser(target:IEventDispatcher=null)
		{
			super(target);
		}
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