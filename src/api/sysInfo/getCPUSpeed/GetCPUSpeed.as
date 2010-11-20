package api.sysInfo.getCPUSpeed
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.getCPUSpeed.GetCPUSpeedEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.getCPUSpeed.GetCPUSpeedEvent")]
	[Bindable]
	public class GetCPUSpeed extends SysInfo
	{
		// Result
		public var speed:Number = 0;
		
		public function GetCPUSpeed(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getCPUSpeed():void
		{
			ssCore.SysInfo.getCPUSpeed( {}
										   ,{callback:actionComplete, errorSTR:"getCPUSpeedError", code:"38003"} );
		}
		override protected function sendResult( r:Object ):void
		{
			speed = Number( r.result );
			
			var e : GetCPUSpeedEvent = new GetCPUSpeedEvent( GetCPUSpeedEvent.RESULT );
			e.speed = speed;
			dispatchEvent( e );
		}
	}
}