package api.fileSys.fileExists
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.fileExists.FileExistsEvent;
	import api.fileSys.FileSys;

    [Event(name="complete", type="FileExistsEvent")]
    [Event(name="missingPath", type="FileExistsEvent")]
    [Event(name="result", type="FileExistsEvent")]
    [Event(name="fileExistsError", type="FileSysError")]
    [Bindable]
	public class FileExists extends FileSys
	{		
		// Required
		public var path:String = null;
		
		// Result
		public var exists:Boolean = false;
		
		public function FileExists(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function fileExists( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileExists( {path:path}
											  ,{callback:actionComplete, errorSTR:"fileExistsError", code:"9009"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			exists = checkBoolean( r.result );
			
			var e : FileExistsEvent = new FileExistsEvent( FileExistsEvent.RESULT );
			e.exists = exists;
			dispatchEvent( e );
		}
	}
}