package api.fileSys.appendToFileUTF16
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class AppendToFileUTF16 extends FileSys
	{
		// Optional
		public var bigEndian:Boolean = false;
		public var writeBOM:Boolean = true;
		
		// Required
		public var data:String = null;
		public var path:String = null;
		
		public function AppendToFileUTF16(target:IEventDispatcher=null)
		{
			super(target);
		}
		
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