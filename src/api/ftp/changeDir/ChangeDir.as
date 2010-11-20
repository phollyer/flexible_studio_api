package api.ftp.changeDir
{
	import api.events.ftp.changeDir.ChangeDirEvent;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
	*/
	public class ChangeDir extends Ftp
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var remotePath:String = null;
		
		/**
		* Constructor for Ftp.ChangeDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
		*/
		public function ChangeDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param remoteDirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FTP_changeDir.html Northcode Help Documentation
		*/
		public function changeDir( remoteDirPath:String = null ):void
		{
			remotePath = compareStrings( remoteDirPath , remotePath );
			
			switch( remotePath )
			{
				case null:
					pathMissing();
					break;
				default:
					ssCore.Ftp.changeDir( {remotePath:remotePath}
										 ,{callback:actionComplete, errorSTR:"changeDirError", code:"7008"} );
			}
		}
		private function pathMissing():void
		{
			var e : ChangeDirEvent = new ChangeDirEvent( ChangeDirEvent.RESULT_PATH );
			dispatchEvent( e );
		}
	}
}