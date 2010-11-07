package api.events.sysInfo.getConnectInfo
{
	import flash.events.Event;
	
	import api.events.sysInfo.SysInfoEvent;

	public class GetConnectInfoEvent extends SysInfoEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var activeDialupConnections:Number = 0;
		public var connectionName:String = null;
		public var isConnected:Boolean = false;
		public var isOffline:Boolean = true;
		public var usingLAN:Boolean = false;
		public var usingMODEM:Boolean = false;
		public var usingProxy:Boolean = false;
		
		public function GetConnectInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetConnectInfoEvent = new GetConnectInfoEvent( type );
			e.activeDialupConnections = activeDialupConnections;
			e.connectionName = connectionName;
			e.isConnected = isConnected;
			e.isOffline = isOffline;
			e.usingLAN = usingLAN;
			e.usingMODEM = usingMODEM;
			e.usingProxy = usingProxy;
			return e;
		}
	}
}