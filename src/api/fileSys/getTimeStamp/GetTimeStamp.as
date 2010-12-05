package api.fileSys.getTimeStamp
{
	import api.events.fileSys.getTimeStamp.GetTimeStampEvent;

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
	* @eventType api.events.fileSys.getTimeStamp.GetTimeStampEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.getTimeStamp.GetTimeStampEvent")]
	[Bindable]
	/**
	* Returns the time of creation or last modification for the specified file or folder.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getTimeStamp.html Northcode Help Documentation
	*/
	public class GetTimeStamp extends FileSys
	{		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>false</code>
		*/
		public var useUTC:Boolean = false;
		 
		// Required
		/**
		* A fully qualified file or folder path path (drive letter or UNC path). This parameter supports monikers.
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
		public var timeStamp:String = null;
		
		/**
		* Constructor for FileSys.GetTimeStamp()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getTimeStamp.html Northcode Help Documentation
		*/
		public function GetTimeStamp(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Returns the time of creation or last modification for the specified file or folder.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getTimeStamp.html Northcode Help Documentation
		*/
		public function getTimeStamp( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getTimeStamp( {path:path , useUTC:useUTC}
												,{callback:actionComplete, errorSTR:"getTimeStampError", code:"9001"} );
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
			timeStamp = r.result;
			
			var e : GetTimeStampEvent = new GetTimeStampEvent( GetTimeStampEvent.RESULT );
			e.timeStamp = timeStamp;
			dispatchEvent( e );
		}
		
	}
}