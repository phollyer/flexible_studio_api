package api.shell.stopWait
{
	import api.events.shell.stopWait.StopWaitEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Stop all waiting Shell.execute and Shell.open commands and force them to return immediately whether the wait conditions have been satisfied or not. This is useful when you have used an infinte timeout and are waiting for an application to finish.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_stopWait.html Northcode Help Documentation
	*/
	public class StopWait extends Shell
	{						
		/**
		* Constructor for Shell.StopWait()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_stopWait.html Northcode Help Documentation
		*/
		public function StopWait(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Stop all waiting Shell.execute and Shell.open commands and force them to return immediately whether the wait conditions have been satisfied or not. This is useful when you have used an infinte timeout and are waiting for an application to finish.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_stopWait.html Northcode Help Documentation
		*/
		public function stopWait( filePath:String = null ):void
		{
			ssCore.Shell.stopWait( {}
								  ,{callback:actionComplete, errorSTR:"stopWaitError", code:"3008"} );
		}
	}
}