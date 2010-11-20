package api.sysInfo.getMemoryInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getMemoryInfo.GetMemoryInfoEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getMemoryInfo.GetMemoryInfoEvent")]
	[Bindable]
	public class GetMemoryInfo extends SysInfo
	{
		// Result
		public var freePhysicalMemory:Number = 0;
		public var freeVirtualMemory:Number = 0;
		public var totalPhysicalMemory:Number = 0;
		public var totalVirtualMemory:Number = 0;		
		
		public function GetMemoryInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getMemoryInfo():void
		{
			ssCore.SysInfo.getMemoryInfo( {}
										 ,{callback:actionComplete, errorSTR:"getMemoryInfoError", code:"38010"} );
		}
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