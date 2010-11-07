package api.sysTools.killProcess
{
	import flash.events.IEventDispatcher;
	import api.sysTools.SysTools;
	
	[Event(name="missingProcessId" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class KillProcess extends SysTools
	{
		// Optional
		public var force:Boolean = false;
		
		// Required
		public var processId:String = null;
		
		public function KillProcess(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function killProcess( id:String = null ):void
		{
			processId = compareStrings( id , processId );
			
			switch( processId )
			{
				case null:
					missingProcessId();
					break;
				default:
					ssCore.SysTools.killProcess( {processId:processId , force:force}
												,{callback:actionComplete, errorSTR:"killProcessError", code:"39004"} );
			}
		}
	}
}