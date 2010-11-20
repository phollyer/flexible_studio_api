package api.fileSys.fileSize
{
	import api.events.fileSys.fileSize.FileSizeEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileSize.html Northcode Help Documentation
	*/
	public class FileSize extends FileSys
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
		* @defaultValue <code>0</code>
		*/
		public var size:Number = 0;
		
		/**
		* Constructor for FileSys.FileSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileSize.html Northcode Help Documentation
		*/
		public function FileSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_fileSize.html Northcode Help Documentation
		*/
		public function fileSize( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{ 
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileSize( {path:path}
											,{callback:actionComplete, errorSTR:"fileSizeError", code:"9022"} );
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
			size = Number( r.result );
			
			var e : FileSizeEvent = new FileSizeEvent( FileSizeEvent.RESULT );
			e.size = size;
			dispatchEvent( e );
		}
	}
}