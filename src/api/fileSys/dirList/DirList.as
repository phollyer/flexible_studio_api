package api.fileSys.dirList
{	
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.dirList.DirListEvent;
	import api.fileSys.FileSys;

    [Event(name="complete", type="DirListEvent")]
    [Event(name="missingPath", type="DirListEvent")]
    [Event(name="result", type="DirListEvent")]
    [Event(name="dirListError", type="FileSysError")]
    [Bindable]
	public class DirList extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var directoryList:Array = null;
		
		public function DirList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function dirList( dirPath:String = null ):void
		{
			path = compareStrings( dirPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.dirList( {path:path , delimiter:PIPE}
										   ,{callback:actionComplete, errorSTR:"dirListError", code:"9010"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			directoryList = r.result.split( PIPE );
			
			var e : DirListEvent = new DirListEvent( DirListEvent.RESULT );
			e.directoryList = directoryList;
			dispatchEvent( e );
		}
	}
}