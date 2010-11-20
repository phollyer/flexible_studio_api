package api.ftp.remoteFile
{
	import flash.events.IEventDispatcher;
	import api.ftp.Ftp;

	[Event(name="missingFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoteFile extends Ftp
	{
		// Required
		public var remoteFile:String = null;
		
		public function RemoteFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setRemoteFile( path:String = null ):void
		{
			remoteFile = compareStrings( path , remoteFile );
			
			switch( remoteFile )
			{
				case null:
					missingFile();
					break;
				default:
					ssCore.Ftp.remoteFile( {remoteFile:remoteFile}
										  ,{callback:actionComplete, errorSTR:"remoteFileError", code:"7022"} );
			}
		}
	}
}