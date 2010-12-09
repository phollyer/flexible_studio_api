package api.shell.resolveMoniker
{
	import api.events.shell.resolveMoniker.ResolveMonikerEvent;

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
	* @eventType api.events.shell.resolveMoniker.ResolveMonikerEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.resolveMoniker.ResolveMonikerEvent")]
	[Bindable]
	/**
	* Resolve any monikers in the input path to file system references.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_resolveMoniker.html Northcode Help Documentation
	*/
	public class ResolveMoniker extends Shell
	{						
		// Required
		/**
		* A fully qualified long or short path to a file or folder that may contain a moniker. This parameter supports monikers.
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
		public var fullPath:String = null;
		
		/**
		* Constructor for Shell.ResolveMoniker()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_resolveMoniker.html Northcode Help Documentation
		*/
		public function ResolveMoniker(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Resolve any monikers in the input path to file system references.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_resolveMoniker.html Northcode Help Documentation
		*/
		public function resolveMoniker( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			ssCore.Shell.resolveMoniker( {path:path}
										,{callback:actionComplete, errorSTR:"resolveMonikerError", code:"3007"} );
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
			fullPath = r.result;
			
			var e : ResolveMonikerEvent = new ResolveMonikerEvent( ResolveMonikerEvent.RESULT );
			e.fullPath = fullPath;
			dispatchEvent( e );
		}
	}
}