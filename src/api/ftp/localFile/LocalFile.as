package api.ftp.localFile
{
	import api.events.ftp.localFile.LocalFileEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingFile", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Setting FTP.localFile tells the plugin where to create the file being downloaded, or where to get the file to be uploaded.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_localFile.html Northcode Help Documentation
	*/
	public class LocalFile extends Ftp
	{
		// Required
		/**
		* Fully qualified path to a local file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var localFilePath:String = null;
		
		/**
		* Constructor for Ftp.LocalFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_localFile.html Northcode Help Documentation
		*/
		public function LocalFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Setting FTP.localFile tells the plugin where to create the file being downloaded, or where to get the file to be uploaded.
		*
		*
		* @param pathToLocalFile
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_localFile.html Northcode Help Documentation
		*/
		public function localFile( pathToLocalFile:String = null ):void
		{
			localFilePath = compareStrings( pathToLocalFile , localFilePath );
			
			switch( localFilePath )
			{
				case null:
					missingFile();
					break;
				default:
					ssCore.Ftp.localFile( {localFile:localFilePath}
										 ,{callback:actionComplete, errorSTR:"localFileError", code:"7018"} );
			}
		}
	}
}