package api.http.proxyPswd
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingPswd" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class ProxyPswd extends Http
	{
		// Required
		public var password:String = null;
		
		public function ProxyPswd(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function proxyPswd( pswd:String = null ):void
		{
			password = compareStrings( pswd , password );
			
			switch( password )
			{
				case null:
					missingPswd();
					break;
				default:
					ssCore.Http.proxyPswd( {password:password}
										  ,{callback:actionComplete, errorSTR:"proxyPswdError", code:"4025"} );
			}
		}
	}
}