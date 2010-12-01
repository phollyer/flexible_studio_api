package api.fileSys.appendToFileBinary
{
	import api.events.fileSys.appendToFileBinary.AppendToFileBinaryEvent;

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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileBinary.html Northcode Help Documentation
	*/
	public class AppendToFileBinary extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.AppendToFileBinary()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileBinary.html Northcode Help Documentation
		*/
		public function AppendToFileBinary(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		*
		*
		*
		* @param filePath
		*
		* @param fileData
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_appendToFileBinary.html Northcode Help Documentation
		*/
		public function appendToFileBinary( filePath:String = null , fileData:String = null ):void
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
			ssCore.FileSys.appendToFileBinary( {data:data , path:path}
										,{callback:actionComplete, errorSTR:"appendToFileBinaryError", code:"9014"} );
		}

	}
}