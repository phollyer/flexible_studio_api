package api.http.userAgent
{
	import flash.events.IEventDispatcher;
	import api.http.Http;

	[Event(name="missingUserAgent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class UserAgent extends Http
	{
		// Required
		public var agent:String = null;
		
		public function UserAgent(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function userAgent( userAgentSTR:String = null ):void
		{
			agent = compareStrings( userAgentSTR , agent );
			
			switch( agent )
			{
				case null:
					missingUserAgent();
					break;
				default:
					ssCore.Http.userAgent( {userAgent:agent}
										  ,{callback:actionComplete, errorSTR:"userAgentError", code:"4030"} );
			}
		}
	}
}