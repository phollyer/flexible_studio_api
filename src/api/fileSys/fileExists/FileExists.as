package api.fileSys.fileExists
{
	import api.events.fileSys.fileExists.FileExistsEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="FileExistsEvent")]
    [Event(name="missingPath", type="FileExistsEvent")]
    [Event(name="result", type="FileExistsEvent")]
    [Event(name="fileExistsError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileExists.html Northcode Help Documentation
	*/
	public class FileExists extends FileSys
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
		* @defaultValue <code>false</code>
		*/
		public var exists:Boolean = false;
		
		/**
		* Constructor for FileSys.FileExists()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileExists.html Northcode Help Documentation
		*/
		public function FileExists(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileExists.html Northcode Help Documentation
		*/
		public function fileExists( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileExists( {path:path}
											  ,{callback:actionComplete, errorSTR:"fileExistsError", code:"9009"} );
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
			exists = checkBoolean( r.result );
			
			var e : FileExistsEvent = new FileExistsEvent( FileExistsEvent.RESULT );
			e.exists = exists;
			dispatchEvent( e );
		}
	}
}