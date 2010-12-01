package api.ftp.host
{
	import api.events.ftp.host.HostEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>host</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_HOST
	*/
	[Event(name="missingHost" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_host.html Northcode Help Documentation
	*/
	public class Host extends Ftp
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var host:String = null;
		
		/**
		* Constructor for Ftp.Host()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_host.html Northcode Help Documentation
		*/
		public function Host(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setHost( hostSTR:String = null ):void
		{
			host = compareStrings( hostSTR , host );
			
			switch( host )
			{
				case null:
					missingHost();
					break;
				default:
					ssCore.Ftp.host( {host:host}
									,{callback:actionComplete, errorSTR:"hostError", code:"7004"} );
			}
		}
	}
}