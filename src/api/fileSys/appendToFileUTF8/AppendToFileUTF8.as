package api.fileSys.appendToFileUTF8
{
	import api.events.fileSys.appendToFileUTF8.AppendToFileUTF8Event;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF8.html Northcode Help Documentation
	*/
	public class AppendToFileUTF8 extends FileSys
	{
		// Optional
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
		* Constructor for FileSys.AppendToFileUTF8()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF8.html Northcode Help Documentation
		*/
		public function AppendToFileUTF8(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileUTF8.html Northcode Help Documentation
		*/
		public function appendToFileUTF8( filePath:String = null , fileData:String = null ):void
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
			ssCore.FileSys.appendToFileUTF8( {data:data , path:path , writeBOM:writeBOM}
										,{callback:actionComplete, errorSTR:"appendToFileUTF8Error", code:"9016"} );
		}

	}
}