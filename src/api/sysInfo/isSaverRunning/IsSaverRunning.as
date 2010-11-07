package api.sysInfo.isSaverRunning
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.sysInfo.isSaverRunning.IsSaverRunningEvent;
	import api.sysInfo.SysInfo;
	
	[Event(name="result", type="api.events.sysInfo.isSaverRunning.IsSaverRunningEvent")]
	[Bindable]
	public class IsSaverRunning extends SysInfo
	{
		// Result
		public var isRunning:Boolean = false;
		
		public function IsSaverRunning(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function isSaverRunning():void
		{
			ssCore.SysInfo.isSaverRunning( {}
									   	  ,{callback:actionComplete, errorSTR:"isSaverRunningError", code:"38016"} );
		}
		override protected function sendResult( r:Object ):void
		{
			isRunning = checkBoolean( r.result );
			
			var e : IsSaverRunningEvent = new IsSaverRunningEvent( IsSaverRunningEvent.RESULT );
			e.isRunning = isRunning;
			dispatchEvent( e );
		}
	}
}