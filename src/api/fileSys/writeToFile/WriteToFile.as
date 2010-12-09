package api.fileSys.writeToFile
{
	import api.events.fileSys.writeToFile.WriteToFileEvent;

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
	* Writes data to a text file in a single operation.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFile.html Northcode Help Documentation
	*/
	public class WriteToFile extends FileSys
	{
		// Required
		/**
		* Data to be written.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		/**
		* A fully qualified path to the file you want to write. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.WriteToFile()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFile.html Northcode Help Documentation
		*/
		public function WriteToFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Writes data to a text file in a single operation.
		*
		*
		* @param filePath
		*
		* @param dataSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFile.html Northcode Help Documentation
		*/
		public function writeToFile( filePath:String = null , dataSTR:String = null ):void
		{
			path = compareStrings( filePath , path );
			data = compareStrings( dataSTR , data );
			
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
							write();
					}
			}
		}
		private function write():void
		{
			ssCore.FileSys.writeToFile( {path:path , data:data}
									   ,{callback:actionComplete, errorSTR:"writeToFileError", code:"9036"} );
		}

	}
}