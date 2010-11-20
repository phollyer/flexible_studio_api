package api.ftp.localFile
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class LocalFile extends Ftp
	{
		// Required
		public var localFilePath:String = null;
		
		public function LocalFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function localFile( pathToLocalFile:String = null ):void
		{
			localFilePath = compareStrings( pathToLocalFile , localFilePath );
			
			switch( localFilePath )
			{
				case null:
					missingFile();
					break;
				default:
					ssCore.Ftp.localFile( {localFile:localFilePath}
										 ,{callback:actionComplete, errorSTR:"localFileError", code:"7018"} );
			}
		}
	}
}