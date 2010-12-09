package api.fileSys.appendToFileUTF16
{
	import api.events.fileSys.appendToFileUTF16.AppendToFileUTF16Event;

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
	* Appends the data to the end of a unicode text file without overwriting existing data.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF16.html Northcode Help Documentation
	*/
	public class AppendToFileUTF16 extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var bigEndian:Boolean = false;
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var writeBOM:Boolean = true;
		
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
		* Constructor for FileSys.AppendToFileUTF16()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF16.html Northcode Help Documentation
		*/
		public function AppendToFileUTF16(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Appends the data to the end of a unicode text file without overwriting existing data.
		*
		*
		* @param filePath
		*
		* @param fileData
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF16.html Northcode Help Documentation
		*/
		public function appendToFileUTF16( filePath:String = null , fileData:String = null ):void
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
			ssCore.FileSys.appendToFileUTF16( {data:data , path:path , bigEndian:bigEndian , writeBOM:writeBOM}
										,{callback:actionComplete, errorSTR:"appendToFileUTF16Error", code:"9015"} );
		}

	}
}