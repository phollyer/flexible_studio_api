package api.sysTools.lockWorkStation
{
	import api.events.sysTools.lockWorkStation.LockWorkStationEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Locks the workstation's display, protecting it from unauthorized use.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_lockWorkStation.html Northcode Help Documentation
	*/
	public class LockWorkStation extends SysTools
	{		
		/**
		* Constructor for SysTools.LockWorkStation()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_lockWorkStation.html Northcode Help Documentation
		*/
		public function LockWorkStation(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Locks the workstation's display, protecting it from unauthorized use.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_lockWorkStation.html Northcode Help Documentation
		*/
		public function lockWorkStation():void
		{
			ssCore.SysTools.lockWorkStation( {}
											,{callback:actionComplete, errorSTR:"lockWorkStationError", code:"39005"} );
		}
	}
}