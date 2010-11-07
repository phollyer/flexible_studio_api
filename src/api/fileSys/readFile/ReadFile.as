package api.fileSys.readFile
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.readFile.ReadFileEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.readFile.ReadFileEvent")]
	[Bindable]
	public class ReadFile extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var data:String = null;
		
		public function ReadFile(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function readFile( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFile( {path:path}
											,{callback:actionComplete, errorSTR:"readFileError", code:"9008"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : ReadFileEvent = new ReadFileEvent( ReadFileEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}