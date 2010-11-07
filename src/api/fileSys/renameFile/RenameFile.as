package api.fileSys.renameFile
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingNewName" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RenameFile extends FileSys
	{
		// Required
		public var newName:String = null;
		public var path:String = null;
		
		public function RenameFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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