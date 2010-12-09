package api.sysInfo.getOSVersionInfo
{
	import api.events.sysInfo.getOSVersionInfo.GetOSVersionInfoEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getOSVersionInfo.GetOSVersionInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getOSVersionInfo.GetOSVersionInfoEvent")]
	[Bindable]
	/**
	* Return OS version information in several useful formats.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getOSVersionInfo.html Northcode Help Documentation
	*/
	public class GetOSVersionInfo extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var is64Bit:Boolean = false;	
		/**
		* The format of the verison information is 'Name Version Build ServicePack' e.g. 'Windows 2000 Version 5.
		*
		* @defaultValue <code>null</code>
		*/
		public var longInfo:String = null;
		/**
		* The platform id. Possible values are '1' for WIN32_WINDOWS (Win95, 98 or ME) and '2' for WIN32_NT (Windows NT 3.51, NT 4.0, 2000, XP or 2003/.NET Server, 2008 Server, Vista, Windows 7).
		*
		* @defaultValue <code>null</code>
		*/
		public var platform:String = null;	
		/**
		* Returns a short string representing the OS version. Possible return values are '32s','NT3','NT3.1','NT3.5','NT3.51','NT4','NT5','95','98','2000','XP', '2003 Server', '2008 Server', 'Vista', 'Win7' and 'Unknown'.
		*
		* @defaultValue <code>null</code>
		*/
		public var shortInfo:String = null;
		/**
		* The OS version in major.minor.build format, e.g. 5.0.2195 (for Windows 2000 build 2195).
		*
		* @defaultValue <code>null</code>
		*/
		public var version:String = null;
		
		/**
		* Constructor for SysInfo.GetOSVersionInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getOSVersionInfo.html Northcode Help Documentation
		*/
		public function GetOSVersionInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Return OS version information in several useful formats.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getOSVersionInfo.html Northcode Help Documentation
		*/
		public function getOSVersionInfo():void
		{
			ssCore.SysInfo.getOSVersionInfo( {}
										    ,{callback:actionComplete, errorSTR:"getOSVersionInfoError", code:"38011"} );
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