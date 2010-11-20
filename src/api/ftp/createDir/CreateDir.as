package api.ftp.createDir
{
	import api.events.ftp.createDir.CreateDirEvent;

	import api.ftp.Ftp;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_createDir.html Northcode Help Documentation
	*/
	public class CreateDir extends Ftp
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var remotePath:String = null;
		
		/**
		* Constructor for Ftp.CreateDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_createDir.html Northcode Help Documentation
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_createDir.html Northcode Help Documentation
		*/
		public function createDir( dirPath:String = null ):void
		{
			remotePath = compareStrings( dirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Ftp.createDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"createDirError", code:"7011"} );
			}
		}
	}
}