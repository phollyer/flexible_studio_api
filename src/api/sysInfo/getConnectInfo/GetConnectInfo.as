package api.sysInfo.getConnectInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getConnectInfo.GetConnectInfoEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getConnectInfo.GetConnectInfoEvent")]
	[Bindable]
	public class GetConnectInfo extends SysInfo
	{
		// Result
		public var activeDialupConnections:Number = 0;
		public var connectionName:String = null;
		public var isConnected:Boolean = false;
		public var isOffline:Boolean = false;
		public var usingLAN:Boolean = false;
		public var usingMODEM:Boolean = false;
		public var usingProxy:Boolean = false;
		
		public function GetConnectInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getConnectInfo():void
		{
			ssCore.SysInfo.getConnectInfo( {}
										  ,{callback:actionComplete, errorSTR:"getConnectInfoError", code:"38002"} );
		}
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