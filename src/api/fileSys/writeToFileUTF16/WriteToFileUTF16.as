package api.fileSys.writeToFileUTF16
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class WriteToFileUTF16 extends FileSys
	{
		// Optional
		public var bigEndian:Boolean = false;
		public var writeBOM:Boolean = true;
		
		// Required
		public var data:String = null
		public var path:String = null;
		
		public function WriteToFileUTF16(target:IEventDispatcher=null)
		{
			super(target);
		}
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