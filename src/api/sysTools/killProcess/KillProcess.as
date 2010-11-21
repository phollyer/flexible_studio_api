package api.sysTools.killProcess
{
	import api.events.sysTools.killProcess.KillProcessEvent;

	import api.sysTools.SysTools;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>processId</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PROCESS_ID
	*/
	[Event(name="missingProcessId" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killProcess.html Northcode Help Documentation
	*/
	public class KillProcess extends SysTools
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var force:Boolean = false;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var processId:String = null;
		
		/**
		* Constructor for SysTools.KillProcess()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killProcess.html Northcode Help Documentation
		*/
		public function KillProcess(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param id
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysTools_killProcess.html Northcode Help Documentation
		*/
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