package api.sysTools.releaseMemory
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	
	[Bindable]
	public class ReleaseMemory extends SysTools
	{		
		public function ReleaseMemory(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function releaseMemory():void
		{
			ssCore.SysTools.releaseMemory( {}
										  ,{callback:actionComplete, errorSTR:"releaseMemoryError", code:"39006"} );
		}
	}
}