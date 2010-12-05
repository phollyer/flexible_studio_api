package api.sysInfo.isSaverRunning
{
	import api.events.sysInfo.isSaverRunning.IsSaverRunningEvent;

	import api.sysInfo.SysInfo;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.sysInfo.isSaverRunning.IsSaverRunningEvent.RESULT
	*/
	[Event(name="result", type="api.events.sysInfo.isSaverRunning.IsSaverRunningEvent")]
	[Bindable]
	/**
	* Determine whether a screensaver is running or not.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isSaverRunning.html Northcode Help Documentation
	*/
	public class IsSaverRunning extends SysInfo
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var isRunning:Boolean = false;
		
		/**
		* Constructor for SysInfo.IsSaverRunning()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isSaverRunning.html Northcode Help Documentation
		*/
		public function IsSaverRunning(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Determine whether a screensaver is running or not.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_SysInfo_isSaverRunning.html Northcode Help Documentation
		*/
		public function isSaverRunning():void
		{
			ssCore.SysInfo.isSaverRunning( {}
									   	  ,{callback:actionComplete, errorSTR:"isSaverRunningError", code:"38016"} );
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
			isRunning = checkBoolean( r.result );
			
			var e : IsSaverRunningEvent = new IsSaverRunningEvent( IsSaverRunningEvent.RESULT );
			e.isRunning = isRunning;
			dispatchEvent( e );
		}
	}
}