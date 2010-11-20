package api.ftp.renameFile
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingExistingFile" , type="api.events.SWFStudioEvent")]
	[Event(name="missingNewFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RenameFile extends Ftp
	{
		// Required
		public var existingFile:String = null;
		public var newFile:String = null;
		
		public function RenameFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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