package api.fileSys.writeToFileUTF16
{
	import api.events.fileSys.writeToFileUTF16.WriteToFileUTF16Event;

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
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF16.html Northcode Help Documentation
	*/
	public class WriteToFileUTF16 extends FileSys
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
		* Constructor for FileSys.WriteToFileUTF16()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF16.html Northcode Help Documentation
		*/
		public function WriteToFileUTF16(target:IEventDispatcher=null)
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
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_writeToFileUTF16.html Northcode Help Documentation
		*/
		public function writeToFileUTF16( filePath:String = null , dataSTR:String = null ):void
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
			ssCore.FileSys.writeToFileUTF16( {path:path , data:data , bigEndian:bigEndian , writeBOM:writeBOM}
									   	 	,{callback:actionComplete, errorSTR:"writeToFileUTF16Error", code:"9038"} );
		}

	}
}