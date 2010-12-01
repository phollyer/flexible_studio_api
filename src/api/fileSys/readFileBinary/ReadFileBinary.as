package api.fileSys.readFileBinary
{
	import api.events.fileSys.readFileBinary.ReadFileBinaryEvent;

	import api.fileSys.FileSys;

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
	* @eventType api.events.fileSys.readFileBinary.ReadFileBinaryEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.readFileBinary.ReadFileBinaryEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileBinary.html Northcode Help Documentation
	*/
	public class ReadFileBinary extends FileSys
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
		public var data:String = null;
		
		/**
		* Constructor for FileSys.ReadFileBinary()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileBinary.html Northcode Help Documentation
		*/
		public function ReadFileBinary(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileBinary.html Northcode Help Documentation
		*/
		public function readFileBinary( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFileBinary( {path:path}
											,{callback:actionComplete, errorSTR:"readFileBinaryError", code:"9009"} );
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
			data = r.result;
			
			var e : ReadFileBinaryEvent = new ReadFileBinaryEvent( ReadFileBinaryEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}