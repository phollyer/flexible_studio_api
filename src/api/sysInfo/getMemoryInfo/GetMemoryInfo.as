package api.sysInfo.getMemoryInfo
{
	import api.events.sysInfo.getMemoryInfo.GetMemoryInfoEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getMemoryInfo.GetMemoryInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getMemoryInfo.GetMemoryInfoEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMemoryInfo.html Northcode Help Documentation
	*/
	public class GetMemoryInfo extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var freePhysicalMemory:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var freeVirtualMemory:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var totalPhysicalMemory:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var totalVirtualMemory:Number = 0;		
		
		/**
		* Constructor for SysInfo.GetMemoryInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMemoryInfo.html Northcode Help Documentation
		*/
		public function GetMemoryInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getMemoryInfo.html Northcode Help Documentation
		*/
		public function getMemoryInfo():void
		{
			ssCore.SysInfo.getMemoryInfo( {}
										 ,{callback:actionComplete, errorSTR:"getMemoryInfoError", code:"38010"} );
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
			freePhysicalMemory = Number( r.freePhysicalMemory );
			freeVirtualMemory = Number( r.freeVirtualMemory );
			totalPhysicalMemory = Number( r.totalPhysicalMemory );
			totalVirtualMemory = Number( r.totalVirtualMemory );
			
			var e : GetMemoryInfoEvent = new GetMemoryInfoEvent( GetMemoryInfoEvent.RESULT );
			e.freePhysicalMemory = freePhysicalMemory;
			e.freeVirtualMemory = freeVirtualMemory;
			e.totalPhysicalMemory = totalPhysicalMemory;
			e.totalVirtualMemory = totalVirtualMemory;
			dispatchEvent( e );
		}
	}
}