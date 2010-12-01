package api.shell.stopWait
{
	import api.events.shell.stopWait.StopWaitEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	*
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
		*
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