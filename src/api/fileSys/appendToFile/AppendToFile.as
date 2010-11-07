package api.fileSys.appendToFile
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AppendToFile extends FileSys
	{
		// Required
		public var data:String = null;
		public var path:String = null;
		
		public function AppendToFile(target:IEventDispatcher=null)
		{
			super(target);
		}
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