package api.shell.getShortPath
{
	import api.events.shell.getShortPath.GetShortPathEvent;

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
	* @eventType api.events.shell.getShortPath.GetShortPathEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.getShortPath.GetShortPathEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getShortPath.html Northcode Help Documentation
	*/
	public class GetShortPath extends Shell
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
		public var shortPath:String = null;
		
		/**
		* Constructor for Shell.GetShortPath()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getShortPath.html Northcode Help Documentation
		*/
		public function GetShortPath(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_getShortPath.html Northcode Help Documentation
		*/
		public function getShortPath( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.getShortPath( {path:path}
											 ,{callback:actionComplete, errorSTR:"getShortPathError", code:"3003"} );
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
			shortPath = r.result;
			
			var e : GetShortPathEvent = new GetShortPathEvent( GetShortPathEvent.RESULT );
			e.shortPath = shortPath;
			dispatchEvent( e );
		}
	}
}