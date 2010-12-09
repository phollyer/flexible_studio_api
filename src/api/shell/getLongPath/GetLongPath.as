package api.shell.getLongPath
{
	import api.events.shell.getLongPath.GetLongPathEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.shell.getLongPath.GetLongPathEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.getLongPath.GetLongPathEvent")]
	[Bindable]
	/**
	* Convert a short (8.3 compatible) path to a long path name.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getLongPath.html Northcode Help Documentation
	*/
	public class GetLongPath extends Shell
	{				
		// Required
		/**
		* A fully qualified short path to a file or folder.
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
		public var longPath:String = null;
		
		/**
		* Constructor for Shell.GetLongPath()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getLongPath.html Northcode Help Documentation
		*/
		public function GetLongPath(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Convert a short (8.3 compatible) path to a long path name.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getLongPath.html Northcode Help Documentation
		*/
		public function getLongPath( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.getLongPath( {path:path}
											 ,{callback:actionComplete, errorSTR:"getLongPathError", code:"3002"} );
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
			longPath = r.result;
			
			var e : GetLongPathEvent = new GetLongPathEvent( GetLongPathEvent.RESULT );
			e.longPath = longPath;
			dispatchEvent( e );
		}
	}
}