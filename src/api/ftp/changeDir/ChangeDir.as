package api.ftp.changeDir
{
	import api.events.ftp.changeDir.ChangeDirEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* The current directory on the FTP server is changed to the directory specified by remotepath.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
	*/
	public class ChangeDir extends Ftp
	{
		// Required
		/**
		* The path of the new current directory on the FTP server.
		*
		* @defaultValue <code>null</code>
		*/
		public var remotePath:String = null;
		
		/**
		* Constructor for Ftp.ChangeDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
		*/
		public function ChangeDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* The current directory on the FTP server is changed to the directory specified by remotepath.
		*
		*
		* @param remoteDirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
		*/
		public function changeDir( remoteDirPath:String = null ):void
		{
			remotePath = compareStrings( remoteDirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					pathMissing();
					break;
				default:
					ssCore.Ftp.changeDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"changeDirError", code:"7008"} );
			}
		}
		private function pathMissing():void
		{
			var e : ChangeDirEvent = new ChangeDirEvent( ChangeDirEvent.INVALID_PATH );
			dispatchEvent( e );
		}
	}
}