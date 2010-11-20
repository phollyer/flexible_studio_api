package api.fileSys.dirExists
{
	import api.events.fileSys.dirExists.DirExistsEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

    [Event(name="complete", type="DirExistsEvent")]
    [Event(name="missingPath", type="DirExistsEvent")]
    [Event(name="result", type="DirExistsEvent")]
    [Event(name="dirExistsError", type="FileSysError")]
    [Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirExists.html Northcode Help Documentation
	*/
	public class DirExists extends FileSys
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
		* @defaultValue <code>false</code>
		*/
		public var exists:Boolean = false;
		
		/**
		* Constructor for FileSys.DirExists()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirExists.html Northcode Help Documentation
		*/
		public function DirExists(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param dirPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_dirExists.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			exists = checkBoolean( r.result );
			
			var e : DirExistsEvent = new DirExistsEvent( DirExistsEvent.RESULT );
			e.exists = exists;
			dispatchEvent( e );
		}
	}
}