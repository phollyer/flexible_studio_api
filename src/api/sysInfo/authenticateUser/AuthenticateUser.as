package api.sysInfo.authenticateUser
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.authenticateUser.AuthenticateUserEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="missingPassword" , type="api.events.SWFStudioEvent")]
	[Event(name="missingUser" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.sysInfo.authenticateUser.AuthenticateUserEvent")]
	[Bindable]
	public class AuthenticateUser extends SysInfo
	{
		// Optional
		public var domain:String= null;
		
		// Required
		public var password:String = null;
		public var user:String = null;
		
		// Result
		public var verified:Boolean = false;
		
		public function AuthenticateUser(target:IEventDispatcher=null)
		{
			super(target);
		}
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

		override protected function sendResult( r:Object ):void
		{
			verified = checkBoolean( r.result );
			
			var e : AuthenticateUserEvent = new AuthenticateUserEvent( AuthenticateUserEvent.RESULT );
			e.verified = verified;
			dispatchEvent( e );
		}
	}
}