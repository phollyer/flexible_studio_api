package api.fileSys.fileVer
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.fileVer.FileVerEvent;
	import api.fileSys.FileSys;
	
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.fileVer.FileVerEvent")]
	[Bindable]
	public class FileVer extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var version:String = null;
		
		public function FileVer(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function fileVer( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileVer( {path:path}
										   ,{callback:actionComplete, errorSTR:"fileVerError", code:"9023"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			version = r.result;
			
			var e : FileVerEvent = new FileVerEvent( FileVerEvent.RESULT );
			e.version = version;
			dispatchEvent( e );
		}
	}
}