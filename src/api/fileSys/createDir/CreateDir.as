package api.fileSys.createDir
{
	import api.events.fileSys.createDir.CreateDirEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;
	
    [Event(name="complete", type="CreateDirEvent")]
    [Event(name="missingDirPath", type="CreateDirEvent")]
    [Event(name="createDirError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createDir.html Northcode Help Documentation
	*/
	public class CreateDir extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.CreateDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createDir.html Northcode Help Documentation
		*/
		public function CreateDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_createDir.html Northcode Help Documentation
		*/
		public function createDir( dirPath:String = null):void
		{
			path = compareStrings( dirPath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.createDir( {path:path} , {callback:actionComplete, errorSTR:"createDirError", code:"9012"} );
			}
		}
	}
}