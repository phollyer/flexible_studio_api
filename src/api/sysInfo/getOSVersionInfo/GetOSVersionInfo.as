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
	*
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var longInfo:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var platform:String = null;	
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var shortInfo:String = null;
		/**
		* 
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
		*
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