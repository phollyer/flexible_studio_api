package api.http.userAgent
{
	import api.events.http.userAgent.UserAgentEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>userAgent</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_USER_AGENT
	*/
	[Event(name="missingUserAgent" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Sets the value for the user agent header that is sent with each request.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_userAgent.html Northcode Help Documentation
	*/
	public class UserAgent extends Http
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var agent:String = null;
		
		/**
		* Constructor for Http.UserAgent()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_userAgent.html Northcode Help Documentation
		*/
		public function UserAgent(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Sets the value for the user agent header that is sent with each request.
		*
		*
		* @param userAgentSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_userAgent.html Northcode Help Documentation
		*/
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