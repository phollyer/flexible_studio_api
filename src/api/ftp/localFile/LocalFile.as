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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_localFile.html Northcode Help Documentation
	*/
	public class LocalFile extends Ftp
	{
		// Required
		/**
		* 
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
		*
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