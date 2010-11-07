package api.fileSys.dirExists
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.fileSys.dirExists.DirExistsEvent;
	import api.fileSys.FileSys;

    [Event(name="complete", type="DirExistsEvent")]
    [Event(name="missingPath", type="DirExistsEvent")]
    [Event(name="result", type="DirExistsEvent")]
    [Event(name="dirExistsError", type="FileSysError")]
    [Bindable]
	public class DirExists extends FileSys
	{
		// Required
		public var path:String = null;
		
		// Result
		public var exists:Boolean = false;
		
		public function DirExists(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function dirExists( dirPath:String = null ):void
		{
			path = compareStrings( dirPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.dirExists( {path:path}
											 ,{callback:actionComplete, errorSTR:"dirExistsError", code:"9006"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			exists = checkBoolean( r.result );
			
			var e : DirExistsEvent = new DirExistsEvent( DirExistsEvent.RESULT );
			e.exists = exists;
			dispatchEvent( e );
		}
	}
}