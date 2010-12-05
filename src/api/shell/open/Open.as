package api.shell.open
{
	import api.events.shell.open.OpenEvent;

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
	* @eventType api.events.shell.open.OpenEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.open.OpenEvent")]
	[Bindable]
	/**
	* Open a document or resource using the associated application (from the Windows registry). If the document or resource specified by the path argument has no registered association, the command will fail. Using Shell.open produces the same results as double clicking on a file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_open.html Northcode Help Documentation
	*/
	public class Open extends Shell
	{				
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var extension:String = null;
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var useFileExts:Boolean = false;
		
		// Required
		/**
		* A fully qualified path to the document that will be the target of the shell verb. This parameter supports monikers.
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
		public var applicationPath:String = null;
		
		/**
		* Constructor for Shell.Open()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_open.html Northcode Help Documentation
		*/
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Open a document or resource using the associated application (from the Windows registry). If the document or resource specified by the path argument has no registered association, the command will fail. Using Shell.open produces the same results as double clicking on a file.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_open.html Northcode Help Documentation
		*/
		public function open( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					var __o:Object = new Object();
					__o.useFileExts = useFileExts;
					switch( extension != null )
					{
						case true:
							__o.extension = extension;
					}
					
					ssCore.Shell.open( __o
									 ,{callback:actionComplete, errorSTR:"openError", code:"3006"} );
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
			applicationPath = r.result;
			
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			e.applicationPath = applicationPath;
			dispatchEvent( e );
		}
	}
}