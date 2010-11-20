package api.sysInfo.getOSVersionInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getOSVersionInfo.GetOSVersionInfoEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getOSVersionInfo.GetOSVersionInfoEvent")]
	[Bindable]
	public class GetOSVersionInfo extends SysInfo
	{
		// Result
		public var is64Bit:Boolean = false;	
		public var longInfo:String = null;
		public var platform:String = null;	
		public var shortInfo:String = null;
		public var version:String = null;
		
		public function GetOSVersionInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getOSVersionInfo():void
		{
			ssCore.SysInfo.getOSVersionInfo( {}
										    ,{callback:actionComplete, errorSTR:"getOSVersionInfoError", code:"38011"} );
		}
		override protected function sendResult( r:Object ):void
		{
			is64Bit = checkBoolean( r.is64Bit );
			longInfo = r.longInfo;
			platform = r.platform;
			shortInfo = r.shortInfo;
			version = r.version;
			
			var e : GetOSVersionInfoEvent = new GetOSVersionInfoEvent( GetOSVersionInfoEvent.RESULT );
			e.is64Bit = is64Bit;
			e.longInfo = longInfo;
			e.platform = platform;
			e.shortInfo = shortInfo;
			e.version = version;
			dispatchEvent( e );
		}
	}
}