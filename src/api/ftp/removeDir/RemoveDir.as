package api.ftp.removeDir
{
	import api.events.ftp.removeDir.RemoveDirEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingDirPath" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeDir.html Northcode Help Documentation
	*/
	public class RemoveDir extends Ftp
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var remotePath:String = null;
		
		/**
		* Constructor for Ftp.RemoveDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeDir.html Northcode Help Documentation
		*/
		public function RemoveDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_removeDir.html Northcode Help Documentation
		*/
		public function removeDir( dirPath:String = null ):void
		{
			remotePath = compareStrings( dirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Ftp.removeDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"removeDirError", code:"7023"} );
			}
		}
	}
}