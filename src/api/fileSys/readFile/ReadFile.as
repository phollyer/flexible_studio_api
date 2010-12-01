package api.fileSys.readFile
{
	import api.events.fileSys.readFile.ReadFileEvent;

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
	* @eventType api.events.fileSys.readFile.ReadFileEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.readFile.ReadFileEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFile.html Northcode Help Documentation
	*/
	public class ReadFile extends FileSys
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
		public var data:String = null;
		
		/**
		* Constructor for FileSys.ReadFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFile.html Northcode Help Documentation
		*/
		public function ReadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFile.html Northcode Help Documentation
		*/
		public function readFile( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFile( {path:path}
											,{callback:actionComplete, errorSTR:"readFileError", code:"9008"} );
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
			data = r.result;
			
			var e : ReadFileEvent = new ReadFileEvent( ReadFileEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}