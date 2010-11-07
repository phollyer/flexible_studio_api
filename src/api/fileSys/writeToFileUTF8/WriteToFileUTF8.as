package api.fileSys.writeToFileUTF8
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class WriteToFileUTF8 extends FileSys
	{
		// Optional
		public var writeBOM:Boolean = true;
		
		// Required
		public var data:String = null
		public var path:String = null;
		
		public function WriteToFileUTF8(target:IEventDispatcher=null)
		{
			super(target);
		}
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