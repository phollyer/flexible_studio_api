package api.fileSys.removeDir
{
	import flash.events.IEventDispatcher;
	import api.fileSys.FileSys;

	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class RemoveDir extends FileSys
	{
		// Optional
		public var failIfNotExist:Boolean = false;
		
		// Required 
		public var path:String = null;
		
		public function RemoveDir(target:IEventDispatcher=null)
		{
			super(target);
		}
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