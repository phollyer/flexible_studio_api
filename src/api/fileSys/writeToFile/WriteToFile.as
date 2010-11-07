package api.fileSys.writeToFile
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class WriteToFile extends FileSys
	{
		// Required
		public var data:String = null
		public var path:String = null;
		
		public function WriteToFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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