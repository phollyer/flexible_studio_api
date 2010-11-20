package api.fileSys.fileList
{	
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.fileList.FileListEvent;
	import api.fileSys.FileSys;
	
    [Event(name="complete", type="FileListEvent")]
    [Event(name="missingPath", type="FileListEvent")]
    [Event(name="result", type="FileListEvent")]
    [Event(name="fileListError", type="FileSysError")]
    [Bindable]
	public class FileList extends FileSys
	{
		// Optional
		public var showHidden:Boolean = false;
		
		// Required
		public var path:String = null;
		
		// Result
		public var files:Array = null;
		
		public function FileList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function fileList( pathToFolder:String = null ):void
		{
			path = compareStrings( pathToFolder , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileList( {path:path , showHidden:showHidden}
											,{callback:actionComplete, errorSTR:"fileListError", code:"9011"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			files = r.result.split( PIPE );
			
			var e : FileListEvent = new FileListEvent( FileListEvent.RESULT );
			e.files = files;
			dispatchEvent( e );
		}
	}
}