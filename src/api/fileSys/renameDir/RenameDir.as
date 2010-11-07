package api.fileSys.renameDir
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingNewName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RenameDir extends FileSys
	{
		// Required
		public var newName:String = null;
		public var path:String = null;
		
		public function RenameDir(target:IEventDispatcher=null)
		{
			super(target);
		}
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