package api.fileSys.readFileUTF8
{
	import api.events.fileSys.readFileUTF8.ReadFileUTF8Event;

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
	* @eventType api.events.fileSys.readFileUTF8.ReadFileUTF8Event.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.readFileUTF8.ReadFileUTF8Event")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileUTF8.html Northcode Help Documentation
	*/
	public class ReadFileUTF8 extends FileSys
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var requireBOM:Boolean = true;
		
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
		* Constructor for FileSys.ReadFileUTF8()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileUTF8.html Northcode Help Documentation
		*/
		public function ReadFileUTF8(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_readFileUTF8.html Northcode Help Documentation
		*/
		public function readFileUTF8( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.readFileUTF8( {path:path , requireBOM:requireBOM}
											,{callback:actionComplete, errorSTR:"readFileUTF8Error", code:"9029"} );
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
			
			var e : ReadFileUTF8Event = new ReadFileUTF8Event( ReadFileUTF8Event.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}