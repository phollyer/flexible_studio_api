package api.fileSys.renameFile
{
	import api.events.fileSys.renameFile.RenameFileEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>newName</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_NEWNAME
	*/
	[Event(name="missingNewName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Renames an existing file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameFile.html Northcode Help Documentation
	*/
	public class RenameFile extends FileSys
	{
		// Required
		/**
		* The new name for the file.
		*
		* @defaultValue <code>null</code>
		*/
		public var newName:String = null;
		/**
		* A fully qualified path to a file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.RenameFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameFile.html Northcode Help Documentation
		*/
		public function RenameFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Renames an existing file.
		*
		*
		* @param dirPath
		*
		* @param newFileName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameFile.html Northcode Help Documentation
		*/
		public function renameFile( dirPath:String = null , newFileName:String = null ):void
		{
			path = compareStrings( dirPath , path );
			newName = compareStrings( newFileName , newName );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( newName )
					{
						case null:
							missingNewName();
							break;
						default:
							rename();
					}
			}
		}
		private function rename():void
		{
			ssCore.FileSys.renameFile( {path:path , newName:newName}
									 ,{callback:actionComplete, errorSTR:"renameFileError", code:"9032"} );
		}

	}
}