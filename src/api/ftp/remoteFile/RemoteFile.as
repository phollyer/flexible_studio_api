package api.ftp.remoteFile
{
	import api.events.ftp.remoteFile.RemoteFileEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>file</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FILE
	*/
	[Event(name="missingFile" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_remoteFile.html Northcode Help Documentation
	*/
	public class RemoteFile extends Ftp
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var remoteFile:String = null;
		
		/**
		* Constructor for Ftp.RemoteFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_remoteFile.html Northcode Help Documentation
		*/
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