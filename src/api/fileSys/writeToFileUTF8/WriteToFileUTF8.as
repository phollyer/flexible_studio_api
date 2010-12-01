package api.fileSys.writeToFileUTF8
{
	import api.events.fileSys.writeToFileUTF8.WriteToFileUTF8Event;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF8.html Northcode Help Documentation
	*/
	public class WriteToFileUTF8 extends FileSys
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.WriteToFileUTF8()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF8.html Northcode Help Documentation
		*/
		public function WriteToFileUTF8(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @param dataSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF8.html Northcode Help Documentation
		*/
		public function writeToFileUTF8( filePath:String = null , dataSTR:String = null ):void
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
			ssCore.FileSys.writeToFileUTF8( {path:path , data:data , writeBOM:writeBOM}
									   	 	,{callback:actionComplete, errorSTR:"writeToFileUTF8Error", code:"9038"} );
		}

	}
}