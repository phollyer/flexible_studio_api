package api.fileSys.fileVer
{
	import api.events.fileSys.fileVer.FileVerEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.fileSys.fileVer.FileVerEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.fileVer.FileVerEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileVer.html Northcode Help Documentation
	*/
	public class FileVer extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var version:String = null;
		
		/**
		* Constructor for FileSys.FileVer()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileVer.html Northcode Help Documentation
		*/
		public function FileVer(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileVer.html Northcode Help Documentation
		*/
		public function fileVer( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileVer( {path:path}
										   ,{callback:actionComplete, errorSTR:"fileVerError", code:"9023"} );
			}
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			version = r.result;
			
			var e : FileVerEvent = new FileVerEvent( FileVerEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}