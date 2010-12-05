package api.sysInfo.getCPUSpeed
{
	import api.events.sysInfo.getCPUSpeed.GetCPUSpeedEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getCPUSpeed.GetCPUSpeedEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getCPUSpeed.GetCPUSpeedEvent")]
	[Bindable]
	/**
	* Return the CPU speed (of processor0).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getCPUSpeed.html Northcode Help Documentation
	*/
	public class GetCPUSpeed extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var speed:Number = 0;
		
		/**
		* Constructor for SysInfo.GetCPUSpeed()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getCPUSpeed.html Northcode Help Documentation
		*/
		public function GetCPUSpeed(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Return the CPU speed (of processor0).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getCPUSpeed.html Northcode Help Documentation
		*/
		public function getCPUSpeed():void
		{
			ssCore.SysInfo.getCPUSpeed( {}
										   ,{callback:actionComplete, errorSTR:"getCPUSpeedError", code:"38003"} );
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
			speed = Number( r.result );
			
			var e : GetCPUSpeedEvent = new GetCPUSpeedEvent( GetCPUSpeedEvent.RESULT );
			e.speed = speed;
			dispatchEvent( e );
		}
	}
}