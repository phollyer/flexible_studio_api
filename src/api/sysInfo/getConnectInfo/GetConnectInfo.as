package api.sysInfo.getConnectInfo
{
	import api.events.sysInfo.getConnectInfo.GetConnectInfoEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getConnectInfo.GetConnectInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getConnectInfo.GetConnectInfoEvent")]
	[Bindable]
	/**
	* Return internet connection state information.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getConnectInfo.html Northcode Help Documentation
	*/
	public class GetConnectInfo extends SysInfo
	{
		// Result
		/**
		* The number of active dialup connections. This value should be 1 (or higher) when usingModem returns TRUE.
		*
		* @defaultValue <code>0</code>
		*/
		public var activeDialupConnections:Number = 0;
		/**
		* The display name of the internet connection.
		*
		* @defaultValue <code>null</code>
		*/
		public var connectionName:String = null;
		/**
		* TRUE if any kind of internet connection is available.
		*
		* @defaultValue <code>false</code>
		*/
		public var isConnected:Boolean = false;
		/**
		* A boolean value that indicates whether the system is running in OFFLINE mode or not.
		*
		* @defaultValue <code>false</code>
		*/
		public var isOffline:Boolean = false;
		/**
		* A boolean value that indicates whether the system is using the LAN for its internet connection.
		*
		* @defaultValue <code>false</code>
		*/
		public var usingLAN:Boolean = false;
		/**
		* A boolean value that indicates whether the system is using a MODEM for its internet connection.
		*
		* @defaultValue <code>false</code>
		*/
		public var usingMODEM:Boolean = false;
		/**
		* A boolean value that indicates whether the system is using a proxy server for its internet connection.
		*
		* @defaultValue <code>false</code>
		*/
		public var usingProxy:Boolean = false;
		
		/**
		* Constructor for SysInfo.GetConnectInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getConnectInfo.html Northcode Help Documentation
		*/
		public function GetConnectInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Return internet connection state information.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getConnectInfo.html Northcode Help Documentation
		*/
		public function getConnectInfo():void
		{
			ssCore.SysInfo.getConnectInfo( {}
										  ,{callback:actionComplete, errorSTR:"getConnectInfoError", code:"38002"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			activeDialupConnections = Number( r.activeDialupConnections );
			connectionName = r.connectionName;
			isConnected = checkBoolean( r.isConnected );
			isOffline = checkBoolean( r.isOffline );
			usingLAN = checkBoolean( r.usingLAN );
			usingMODEM = checkBoolean( r.usingMODEM );
			usingProxy = checkBoolean( r.usingProxy );
			
			var e : GetConnectInfoEvent = new GetConnectInfoEvent( GetConnectInfoEvent.RESULT );
			e.activeDialupConnections = activeDialupConnections;
			e.connectionName = connectionName;
			e.isConnected = isConnected;
			e.isOffline = isOffline
			e.usingLAN = usingLAN;
			e.usingMODEM = usingMODEM;
			e.usingProxy = usingProxy;
			dispatchEvent( e );
		}
	}
}