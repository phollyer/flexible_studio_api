package api.ftp.renameFile
{
	import api.events.ftp.renameFile.RenameFileEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>existingFile</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_EXISTING_FILE
	*/
	[Event(name="missingExistingFile" , type="api.events.SWFStudioEvent")]
	[Event(name="missingNewFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Rename and/or move a file on the FTP server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_renameFile.html Northcode Help Documentation
	*/
	public class RenameFile extends Ftp
	{
		// Required
		/**
		* The name of an existing file on the FTP server to be renamed.
		*
		* @defaultValue <code>null</code>
		*/
		public var existingFile:String = null;
		/**
		* The new name of the file.
		*
		* @defaultValue <code>null</code>
		*/
		public var newFile:String = null;
		
		/**
		* Constructor for Ftp.RenameFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_renameFile.html Northcode Help Documentation
		*/
		public function RenameFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Rename and/or move a file on the FTP server.
		*
		*
		* @param existingName
		*
		* @param newName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_renameFile.html Northcode Help Documentation
		*/
		public function renameFile( existingName:String = null , newName:String = null ):void
		{
			existingFile = compareStrings( existingName , existingFile );
			newFile = compareStrings( newName , newFile );
			
			switch( existingFile )
			{
				case null:
					missingExistingFile();
					break;
				default:
					switch( newFile )
					{
						case null:
							missingNewFile();
							break;
						default:
							ssCore.Ftp.renameFile( {existingFile:existingFile}
												  ,{callback:actionComplete, errorSTR:"renameFileError", code:"7025"} );
					}
			}
		}

	}
}