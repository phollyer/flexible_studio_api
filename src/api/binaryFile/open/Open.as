package api.binaryFile.open
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.open.OpenEvent;

	import api.vos.binaryFile.AccessModeVO;

	import api.vos.binaryFile.ShareModeVO;

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
	 * @eventType api.events.binaryFile.open.OpenEvent.RESULT
	 */
	[Event(name="result", type="api.events.binaryFile.open.OpenEvent")]
	[Bindable]
	/**
	 * Open an existing file for binary access.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_open.html Northcode Help Documentation
	 */
	public class Open extends BinaryFile
	{
		// Required
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var path:String = null;
		
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>AccessModeVO.READ</code>
		 */
		public var accessMode:String = AccessModeVO.READ;
		/**
		 * 
		 *
		 * @defaultValue <code>ShareModeVO.NONE</code>
		 */
		public var shareMode:String = ShareModeVO.NONE;
		
		// Results
		/**
		 * A system specific error code from the GetLastError function.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var systemError:String = null;
		
		/**
		 * Constructor for BinaryFile.Open()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_open.html Northcode Help Documentation
		 */
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Open an existing file for binary access.
		 *
                 *
		 * @param filePath
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_open.html Northcode Help Documentation
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
					ssCore.BinaryFile.open( {path:path
											,accessMode:accessMode
											,shareMode:shareMode} , {callback:actionComplete, errorSTR:"openError", code:"11007"} );
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
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			dispatchEvent( e );
		}
	}
}