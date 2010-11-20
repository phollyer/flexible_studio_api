package api.sysTools.lockWorkStation
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	
	[Bindable]
	public class LockWorkStation extends SysTools
	{		
		public function LockWorkStation(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function lockWorkStation():void
		{
			ssCore.SysTools.lockWorkStation( {}
											,{callback:actionComplete, errorSTR:"lockWorkStationError", code:"39005"} );
		}
	}
}