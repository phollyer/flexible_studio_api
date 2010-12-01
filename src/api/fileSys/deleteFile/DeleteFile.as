package api.fileSys.deleteFile
{
	import api.events.fileSys.deleteFile.DeleteFileEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="DeleteFileEvent")]
    [Event(name="missingPath", type="DeleteFileEvent")]
    [Event(name="deleteFileError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_deleteFile.html Northcode Help Documentation
	*/
	public class DeleteFile extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfNotExist:Boolean = false;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.DeleteFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_deleteFile.html Northcode Help Documentation
		*/
		public function DeleteFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_deleteFile.html Northcode Help Documentation
		*/
		public function deleteFile( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.deleteFile( {path:path , failIfNotExist:failIfNotExist}
											  ,{callback:actionComplete, errorSTR:"deleteFileError", code:"9005"} );
			}
		}
	}
}