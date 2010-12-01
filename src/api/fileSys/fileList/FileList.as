package api.fileSys.fileList
{
	import api.events.fileSys.fileList.FileListEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;
	
    [Event(name="complete", type="FileListEvent")]
    [Event(name="missingPath", type="FileListEvent")]
    [Event(name="result", type="FileListEvent")]
    [Event(name="fileListError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileList.html Northcode Help Documentation
	*/
	public class FileList extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var showHidden:Boolean = false;
		
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
		public var files:Array = null;
		
		/**
		* Constructor for FileSys.FileList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileList.html Northcode Help Documentation
		*/
		public function FileList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param pathToFolder
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileList.html Northcode Help Documentation
		*/
		public function fileList( pathToFolder:String = null ):void
		{
			path = compareStrings( pathToFolder , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileList( {path:path , showHidden:showHidden}
											,{callback:actionComplete, errorSTR:"fileListError", code:"9011"} );
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
			files = r.result.split( PIPE );
			
			var e : FileListEvent = new FileListEvent( FileListEvent.RESULT );
			e.files = files;
			dispatchEvent( e );
		}
	}
}