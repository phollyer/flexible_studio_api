package api.fileSys.writeToFileBinary
{
	import api.events.fileSys.writeToFileBinary.WriteToFileBinaryEvent;

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
	* Writes binary data to a text file in a single operation.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileBinary.html Northcode Help Documentation
	*/
	public class WriteToFileBinary extends FileSys
	{
		// Required
		/**
		* Data to be written in hex string format.
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
		* Constructor for FileSys.WriteToFileBinary()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileBinary.html Northcode Help Documentation
		*/
		public function WriteToFileBinary(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Writes binary data to a text file in a single operation.
		*
		*
		* @param filePath
		*
		* @param dataSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileBinary.html Northcode Help Documentation
		*/
		public function writeToFileBinary( filePath:String = null , dataSTR:String = null ):void
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
			ssCore.FileSys.writeToFileBinary( {path:path , data:data}
									    	 ,{callback:actionComplete, errorSTR:"writeToFileBinaryError", code:"9037"} );
		}

	}
}