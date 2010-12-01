package api.fileSys.removeDir
{
	import api.events.fileSys.removeDir.RemoveDirEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_removeDir.html Northcode Help Documentation
	*/
	public class RemoveDir extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfNotExist:Boolean = false;
		
		// Required 
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.RemoveDir()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_removeDir.html Northcode Help Documentation
		*/
		public function RemoveDir(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_removeDir.html Northcode Help Documentation
		*/
		public function removeDir( dirPath:String = null ):void
		{
			path = compareStrings( dirPath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.removeDir( {path:path , failIfNotExist:failIfNotExist}
											 ,{callback:actionComplete, errorSTR:"removeDirError", code:"9030"} );
			}
		}
	}
}