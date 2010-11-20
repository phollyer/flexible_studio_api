package api.fileSys.findInFiles
{
	import api.events.fileSys.findInFiles.FindInFilesEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findInFiles.html Northcode Help Documentation
	*/
	public class FindInFiles extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>ALL_FILES</code>
		*/
		public var filter:String = ALL_FILES;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var showHidden:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var subFolders:Boolean = false;
		
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var text:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fileList:Array = null;
		
		/**
		* Constructor for FileSys.FindInFiles()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findInFiles.html Northcode Help Documentation
		*/
		public function FindInFiles(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param folderPath
		*
		* @param searchText
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findInFiles.html Northcode Help Documentation
		*/
		public function findInFiles( folderPath:String = null , searchText:String = null ):void
		{
			path = compareStrings( folderPath , path );
			text = compareStrings( searchText , text );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( text )
					{
						case null:
							missingText();
							break;
						default:
							find();
					}
			}
		}
		private function find():void
		{
			ssCore.FileSys.findInFiles( {path:path , text:text , delimiter:PIPE , filter:filter , showHidden:showHidden , subFolders:subFolders}
									   ,{callback:actionComplete, errorSTR:"findInFilesError", code:"9024"} );
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
			fileList = r.result.split( PIPE );
			
			var e : FindInFilesEvent = new FindInFilesEvent( FindInFilesEvent.RESULT );
			e.fileList = fileList;
			dispatchEvent( e );
		}
	}
}