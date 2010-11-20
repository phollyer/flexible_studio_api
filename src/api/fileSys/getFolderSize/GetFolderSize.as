package api.fileSys.getFolderSize
{
	import api.events.fileSys.getFolderSize.GetFolderSizeEvent;

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
	* @eventType api.events.fileSys.getFolderSize.GetFolderSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.getFolderSize.GetFolderSizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFolderSize.html Northcode Help Documentation
	*/
	public class GetFolderSize extends FileSys
	{
		// Required 
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var bytes:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var gigabytes:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var kilobytes:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var megabytes:Number = 0;
		
		/**
		* Constructor for FileSys.GetFolderSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFolderSize.html Northcode Help Documentation
		*/
		public function GetFolderSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param folderPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFolderSize.html Northcode Help Documentation
		*/
		public function getFolderSize( folderPath:String = null ):void
		{
			path = compareStrings( folderPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getFolderSize( {path:path} 
												 ,{callback:actionComplete, errorSTR:"getFolderSizeError", code:"9026"} );
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
			bytes = Number( r.result );
			gigabytes = Number( r.gb );
			kilobytes = Number( r.kb );
			megabytes = Number( r.mb );
			
			var e : GetFolderSizeEvent = new GetFolderSizeEvent( GetFolderSizeEvent.RESULT );
			e.bytes = bytes;
			e.gigabytes = gigabytes;
			e.kilobytes = kilobytes;
			e.megabytes = megabytes;
			dispatchEvent( e );
		}
	}
}