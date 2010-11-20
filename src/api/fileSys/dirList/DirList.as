package api.fileSys.dirList
{
	import api.events.fileSys.dirList.DirListEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="DirListEvent")]
    [Event(name="missingPath", type="DirListEvent")]
    [Event(name="result", type="DirListEvent")]
    [Event(name="dirListError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirList.html Northcode Help Documentation
	*/
	public class DirList extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var directoryList:Array = null;
		
		/**
		* Constructor for FileSys.DirList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirList.html Northcode Help Documentation
		*/
		public function DirList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirList.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			directoryList = r.result.split( PIPE );
			
			var e : DirListEvent = new DirListEvent( DirListEvent.RESULT );
			e.directoryList = directoryList;
			dispatchEvent( e );
		}
	}
}