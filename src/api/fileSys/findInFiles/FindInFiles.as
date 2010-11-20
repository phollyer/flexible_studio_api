package api.fileSys.findInFiles
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.findInFiles.FindInFilesEvent;
	import api.fileSys.FileSys;

	public class FindInFiles extends FileSys
	{
		// Optional
		public var filter:String = ALL_FILES;
		public var showHidden:Boolean = false;
		public var subFolders:Boolean = false;
		
		// Required
		public var path:String = null;
		public var text:String = null;
		
		// Result
		public var fileList:Array = null;
		
		public function FindInFiles(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function findInFiles( folderPath:String = null , searchText:String = null ):void
		{
			path = compareStrings( folderPath , path );
			text = compareStrings( searchText , text );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( text )
					{
						case null:
							missingText();
							break;
						default:
							find();
					}
			}
		}
		private function find():void
		{
			ssCore.FileSys.findInFiles( {path:path , text:text , delimiter:PIPE , filter:filter , showHidden:showHidden , subFolders:subFolders}
									   ,{callback:actionComplete, errorSTR:"findInFilesError", code:"9024"} );
		}

		override protected function sendResult( r:Object ):void
		{
			fileList = r.result.split( PIPE );
			
			var e : FindInFilesEvent = new FindInFilesEvent( FindInFilesEvent.RESULT );
			e.fileList = fileList;
			dispatchEvent( e );
		}
	}
}