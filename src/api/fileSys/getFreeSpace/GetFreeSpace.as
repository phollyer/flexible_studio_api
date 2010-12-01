package api.fileSys.getFreeSpace
{
	import api.events.fileSys.getFreeSpace.GetFreeSpaceEvent;

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
	* @eventType api.events.fileSys.getFreeSpace.GetFreeSpaceEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.getFreeSpace.GetFreeSpaceEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFreeSpace.html Northcode Help Documentation
	*/
	public class GetFreeSpace extends FileSys
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
		public var kilobytes:Number = 0;
		
		/**
		* Constructor for FileSys.GetFreeSpace()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFreeSpace.html Northcode Help Documentation
		*/
		public function GetFreeSpace(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param driveLetterOrUNCPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getFreeSpace.html Northcode Help Documentation
		*/
		public function getFreeSpace( driveLetterOrUNCPath:String = null ):void
		{
			path = compareStrings( driveLetterOrUNCPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getFreeSpace( {path:path}
												,{callback:actionComplete, errorSTR:"getFreeSpaceError", code:"9027"} );
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
			kilobytes = Number( r.result );
			
			var e : GetFreeSpaceEvent = new GetFreeSpaceEvent( GetFreeSpaceEvent.RESULT );
			e.kilobytes = kilobytes;
			dispatchEvent( e );
		}
	}
}