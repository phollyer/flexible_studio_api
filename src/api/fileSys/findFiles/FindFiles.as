package api.fileSys.findFiles
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.findFiles.FindFilesEvent;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.fileSys.findFiles.FindFilesEvent")]
	[Bindable]
	public class FindFiles extends FileSys
	{		 		
		// Optional
		public var filter:String = ALL_FILES;
		public var showHidden:Boolean = false;
		public var subFolders:Boolean = false;
		
		// Required
		public var path:String = null;
		
		// Results
		public var fileList:Array = null;
				
		public function FindFiles(target:IEventDispatcher = null)
		{
			super(target);
		}
		public function findFiles( folderPath:String = null ):void
		{
			path = compareStrings( folderPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					find();
			}
		}
		private function find():void
		{
			ssCore.FileSys.findFiles( {path:path , delimiter:PIPE , filter:filter , showHidden:showHidden , subFolders:subFolders}
									 ,{callback:actionComplete, errorSTR:"findFilesError", code:"9000"} );
		}
		override protected function sendResult( r:Object ):void
		{			
			fileList = r.result.split( PIPE );
			var e : FindFilesEvent = new FindFilesEvent( FindFilesEvent.RESULT );
			e.fileList = fileList;
			dispatchEvent( e );
		}
	}
}