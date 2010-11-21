package api.binaryFile.create
{
	import api.binaryFile.BinaryFile;

	import api.events.binaryFile.create.CreateEvent;

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
	* @eventType api.events.binaryFile.create.CreateEvent.RESULT
	*/
	[Event(name="result", type="api.events.binaryFile.create.CreateEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_create.html Northcode Help Documentation
	*/
	public class Create extends BinaryFile
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
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var failIfExists:Boolean = false;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var systemError:String = null;
		
		/**
		* Constructor for BinaryFile.Create()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_create.html Northcode Help Documentation
		*/
		public function Create(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_BinaryFile_create.html Northcode Help Documentation
		*/
		public function create( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.BinaryFile.create( {path:path
											  ,accessMode:accessMode
											  ,shareMode:shareMode
											  ,failIfExists:failIfExists} , {callback:actionComplete, errorSTR:"createError", code:"11002"} );
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
			var e : CreateEvent = new CreateEvent( CreateEvent.RESULT );
			dispatchEvent( e );
		}
	}
}