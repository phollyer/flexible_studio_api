package api.fileSys.deleteFile
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

    [Event(name="complete", type="DeleteFileEvent")]
    [Event(name="missingPath", type="DeleteFileEvent")]
    [Event(name="deleteFileError", type="FileSysError")]
    [Bindable]
	public class DeleteFile extends FileSys
	{
		// Optional
		public var failIfNotExist:Boolean = false;
		
		// Required
		public var path:String = null;
		
		public function DeleteFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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