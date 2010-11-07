package api.ftp.removeFile
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoveFile extends Ftp
	{
		// Required
		public var remoteFile:String = null;
		
		public function RemoveFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function removeFile( pathToFile:String = null ):void
		{
			remoteFile = compareStrings( pathToFile , remoteFile );
			
			switch( remoteFile )
			{
				case null:
					missingFile();
					break;
				default:
					ssCore.Ftp.removeFile( {remoteFile:remoteFile}
										  ,{callback:actionComplete, errorSTR:"removeFileError", code:"7024"} );
			}
		}
	}
}