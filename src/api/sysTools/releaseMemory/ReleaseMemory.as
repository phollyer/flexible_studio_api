package api.sysTools.releaseMemory
{
	import api.events.sysTools.releaseMemory.ReleaseMemoryEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_releaseMemory.html Northcode Help Documentation
	*/
	public class ReleaseMemory extends SysTools
	{		
		/**
		* Constructor for SysTools.ReleaseMemory()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_releaseMemory.html Northcode Help Documentation
		*/
		public function ReleaseMemory(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_releaseMemory.html Northcode Help Documentation
		*/
		public function releaseMemory():void
		{
			ssCore.SysTools.releaseMemory( {}
										  ,{callback:actionComplete, errorSTR:"releaseMemoryError", code:"39006"} );
		}
	}
}