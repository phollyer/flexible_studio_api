package api.ftp.getCurrentDir
{
	import api.events.ftp.getCurrentDir.GetCurrentDirEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ftp.getCurrentDir.GetCurrentDirEvent.RESULT
	*/
	[Event(name="result", type="api.events.ftp.getCurrentDir.GetCurrentDirEvent")]
	[Bindable]
	/**
	* Get the path of the current directory on the FTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getCurrentDir.html Northcode Help Documentation
	*/
	public class GetCurrentDir extends Ftp
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var currentDir:String = null;
		
		/**
		* Constructor for Ftp.GetCurrentDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getCurrentDir.html Northcode Help Documentation
		*/
		public function GetCurrentDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the path of the current directory on the FTP server.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_getCurrentDir.html Northcode Help Documentation
		*/
		public function getCurrentDir():void
		{
			ssCore.Ftp.getCurrentDir( {}
									 ,{callback:actionComplete, errorSTR:"getCurrentDirError", code:"7013"} );
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
			currentDir = r.result;
			
			var e : GetCurrentDirEvent = new GetCurrentDirEvent( GetCurrentDirEvent.RESULT );
			e.currentDir = currentDir;
			dispatchEvent( e );
		}
	}
}