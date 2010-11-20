package api.sysInfo.getProcessMemoryInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getProcessMemoryInfo.GetProcessMemoryInfoEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getProcessMemoryInfo.GetProcessMemoryInfoEvent")]
	[Bindable]
	public class GetProcessMemoryInfo extends SysInfo
	{
		// Result
		public var totalMemoryUsed:Number = 0;
		
		public function GetProcessMemoryInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getProcessMemoryInfo():void
		{
			ssCore.SysInfo.getProcessMemoryInfo( {}
										   		,{callback:actionComplete, errorSTR:"getProcessMemoryInfoError", code:"38012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			totalMemoryUsed = Number( r.result );
			
			var e : GetProcessMemoryInfoEvent = new GetProcessMemoryInfoEvent( GetProcessMemoryInfoEvent.RESULT );
			e.totalMemoryUsed = totalMemoryUsed;
			dispatchEvent( e );
		}
	}
}