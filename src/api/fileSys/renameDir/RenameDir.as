package api.fileSys.renameDir
{
	import api.events.fileSys.renameDir.RenameDirEvent;

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
	* Renames an existing directory.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameDir.html Northcode Help Documentation
	*/
	public class RenameDir extends FileSys
	{
		// Required
		/**
		* The new name for the directory.
		*
		* @defaultValue <code>null</code>
		*/
		public var newName:String = null;
		/**
		* A fully qualified path to a directory. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.RenameDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameDir.html Northcode Help Documentation
		*/
		public function RenameDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Renames an existing directory.
		*
		*
		* @param dirPath
		*
		* @param newDirName
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_renameDir.html Northcode Help Documentation
		*/
		public function renameDir( dirPath:String = null , newDirName:String = null ):void
		{
			path = compareStrings( dirPath , path );
			newName = compareStrings( newDirName , newName );
			
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
			ssCore.FileSys.renameDir( {path:path , newName:newName}
									 ,{callback:actionComplete, errorSTR:"renameDirError", code:"9031"} );
		}

	}
}