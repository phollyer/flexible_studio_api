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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getConnectInfo.html Northcode Help Documentation
	*/
	public class GetConnectInfo extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var activeDialupConnections:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var connectionName:String = null;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isConnected:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isOffline:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var usingLAN:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var usingMODEM:Boolean = false;
		/**
		* 
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
		*
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