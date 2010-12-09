package api.ftp.removeFile
{
	import api.events.ftp.removeFile.RemoveFileEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>file</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FILE
	*/
	[Event(name="missingFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Remove the specified file from the FTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeFile.html Northcode Help Documentation
	*/
	public class RemoveFile extends Ftp
	{
		// Required
		/**
		* Path to the remote file on the FTP server.
		*
		* @defaultValue <code>null</code>
		*/
		public var remoteFile:String = null;
		
		/**
		* Constructor for Ftp.RemoveFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeFile.html Northcode Help Documentation
		*/
		public function RemoveFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Remove the specified file from the FTP server.
		*
		*
		* @param pathToFile
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeFile.html Northcode Help Documentation
		*/
		public function removeFile( pathToFile:String = null ):void
		{
			remoteFile = compareStrings( pathToFile , remoteFile );
			
			switch( remoteFile )
			{
				case null:
					missingFile();
					break;
				default:
					ssCore.Ftp.removeFile( {remoteFile:remoteFile}
										  ,{callback:actionComplete, errorSTR:"removeFileError", code:"7024"} );
			}
		}
	}
}