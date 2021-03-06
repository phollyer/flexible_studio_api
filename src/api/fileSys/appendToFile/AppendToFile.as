package api.fileSys.appendToFile
{
	import api.events.fileSys.appendToFile.AppendToFileEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Appends the data to the end of a text file without overwriting existing data.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFile.html Northcode Help Documentation
	*/
	public class AppendToFile extends FileSys
	{
		// Required
		/**
		* Data to be added to the end of the file.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		/**
		* A fully qualified path to a file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.AppendToFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFile.html Northcode Help Documentation
		*/
		public function AppendToFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Appends the data to the end of a text file without overwriting existing data.
		*
		*
		* @param filePath
		*
		* @param fileData
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFile.html Northcode Help Documentation
		*/
		public function appendToFile( filePath:String = null , fileData:String = null ):void
		{
			path = compareStrings( filePath , path );
			data = compareStrings( fileData , data );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( data )
					{
						case null:
							missingData();
							break;
						default:
							append();
					}
			}
		}
		private function append():void
		{
			ssCore.FileSys.appendToFile( {data:data , path:path}
										,{callback:actionComplete, errorSTR:"appendToFileError", code:"9013"} );
		}

	}
}