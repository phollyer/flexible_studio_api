package api.http.authPswd
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingPswd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AuthPswd extends Http
	{
		// Required
		public var password:String = null;
		
		public function AuthPswd(target:IEventDispatcher=null)
		{
			super(target);
		}
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