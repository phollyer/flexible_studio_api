package api.sysInfo.getProcessMemoryInfo
{
	import api.events.sysInfo.getProcessMemoryInfo.GetProcessMemoryInfoEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getProcessMemoryInfo.GetProcessMemoryInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getProcessMemoryInfo.GetProcessMemoryInfoEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getProcessMemoryInfo.html Northcode Help Documentation
	*/
	public class GetProcessMemoryInfo extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var totalMemoryUsed:Number = 0;
		
		/**
		* Constructor for SysInfo.GetProcessMemoryInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getProcessMemoryInfo.html Northcode Help Documentation
		*/
		public function GetProcessMemoryInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getProcessMemoryInfo.html Northcode Help Documentation
		*/
		public function getProcessMemoryInfo():void
		{
			ssCore.SysInfo.getProcessMemoryInfo( {}
										   		,{callback:actionComplete, errorSTR:"getProcessMemoryInfoError", code:"38012"} );
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
			totalMemoryUsed = Number( r.result );
			
			var e : GetProcessMemoryInfoEvent = new GetProcessMemoryInfoEvent( GetProcessMemoryInfoEvent.RESULT );
			e.totalMemoryUsed = totalMemoryUsed;
			dispatchEvent( e );
		}
	}
}