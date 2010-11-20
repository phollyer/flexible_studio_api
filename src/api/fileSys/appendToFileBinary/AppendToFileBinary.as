package api.fileSys.appendToFileBinary
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AppendToFileBinary extends FileSys
	{
		// Required
		public var data:String = null;
		public var path:String = null;
		
		public function AppendToFileBinary(target:IEventDispatcher=null)
		{
			super(target);
		}
		
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