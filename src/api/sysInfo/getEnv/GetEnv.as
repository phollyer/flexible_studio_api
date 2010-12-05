package api.sysInfo.getEnv
{
	import api.events.sysInfo.getEnv.GetEnvEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>variable</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_VARIABLE
	*/
	[Event(name="missingVariable" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.getEnv.GetEnvEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.getEnv.GetEnvEvent")]
	[Bindable]
	/**
	* Provides access to operating system environment variables, like PATH.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getEnv.html Northcode Help Documentation
	*/
	public class GetEnv extends SysInfo
	{
		// Required
		/**
		* Name of the environment variable to retrieve.
		*
		* @defaultValue <code>null</code>
		*/
		public var variable:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var value:String = null;
		
		/**
		* Constructor for SysInfo.GetEnv()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getEnv.html Northcode Help Documentation
		*/
		public function GetEnv(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Provides access to operating system environment variables, like PATH.
		*
		*
		* @param envVariable
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_getEnv.html Northcode Help Documentation
		*/
		public function getEnv( envVariable:String = null ):void
		{
			variable = compareStrings( envVariable , variable );
			switch( variable )
			{
				case null:
					missingVariable();
					break;
				default:
					ssCore.SysInfo.getEnv( {}
										   		 ,{callback:actionComplete, errorSTR:"getEnvError", code:"38006"} );
			}
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
			value = r.result;
			
			var e : GetEnvEvent = new GetEnvEvent( GetEnvEvent.RESULT );
			e.value = value;
			dispatchEvent( e );
		}
	}
}