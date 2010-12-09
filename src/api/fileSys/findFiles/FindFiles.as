package api.fileSys.findFiles
{
	import api.events.fileSys.findFiles.FindFilesEvent;

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
	* @eventType api.events.fileSys.findFiles.FindFilesEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.findFiles.FindFilesEvent")]
	[Bindable]
	/**
	* Search the file system for files with names matching a pattern.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findFiles.html Northcode Help Documentation
	*/
	public class FindFiles extends FileSys
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
		* A fully qualified path to a directory to search. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fileList:Array = null;
				
		/**
		* Constructor for FileSys.FindFiles()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findFiles.html Northcode Help Documentation
		*/
		public function FindFiles(target:IEventDispatcher = null)
		{
			super(target);
		}
		/**
		* Search the file system for files with names matching a pattern.
		*
		*
		* @param folderPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_findFiles.html Northcode Help Documentation
		*/
		public function findFiles( folderPath:String = null ):void
		{
			path = compareStrings( folderPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					find();
			}
		}
		private function find():void
		{
			ssCore.FileSys.findFiles( {path:path , delimiter:PIPE , filter:filter , showHidden:showHidden , subFolders:subFolders}
									 ,{callback:actionComplete, errorSTR:"findFilesError", code:"9000"} );
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
			var e : FindFilesEvent = new FindFilesEvent( FindFilesEvent.RESULT );
			e.fileList = fileList;
			dispatchEvent( e );
		}
	}
}