package api.fileSys.createDir
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;
	
    [Event(name="complete", type="CreateDirEvent")]
    [Event(name="missingDirPath", type="CreateDirEvent")]
    [Event(name="createDirError", type="FileSysError")]
    [Bindable]
	public class CreateDir extends FileSys
	{
		// Required
		public var path:String = null;
		
		public function CreateDir(target:IEventDispatcher=null)
		{
			super(target);
		}
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