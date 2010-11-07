package api.fileSys.fileSize
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.fileSize.FileSizeEvent;
	import api.fileSys.FileSys;

	public class FileSize extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var size:Number = 0;
		
		public function FileSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function fileSize( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{ 
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.fileSize( {path:path}
											,{callback:actionComplete, errorSTR:"fileSizeError", code:"9022"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			size = Number( r.result );
			
			var e : FileSizeEvent = new FileSizeEvent( FileSizeEvent.RESULT );
			e.size = size;
			dispatchEvent( e );
		}
	}
}