package api.http.host
{
	import api.events.http.host.HostEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>host</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_HOST
	*/
	[Event(name="missingHost" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Identifies the host server that the plugin will connect to.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_host.html Northcode Help Documentation
	*/
	public class Host extends Http
	{
		// Required
		/**
		* Name (or IP address) of the server that the plugin will connect to.
		*
		* @defaultValue <code>null</code>
		*/
		public var hostName:String = null;
		
		/**
		* Constructor for Http.Host()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_host.html Northcode Help Documentation
		*/
		public function Host(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Identifies the host server that the plugin will connect to.
		*
		*
		* @param hostSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_host.html Northcode Help Documentation
		*/
		public function host( hostSTR:String = null ):void
		{
			hostName = compareStrings( hostSTR , hostName );
			
			switch( hostName )
			{
				case null:
					missingHost();
					break;
				default:
					ssCore.Http.host( {host:hostName}
									 ,{callback:actionComplete, errorSTR:"hostError", code:"4018"} );
			}
		}
	}
}