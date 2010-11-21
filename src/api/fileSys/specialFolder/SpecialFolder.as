package api.fileSys.specialFolder
{
	import api.events.fileSys.specialFolder.SpecialFolderEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>folderID</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_FOLDER_I_D
	*/
	[Event(name="missingFolderID" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.fileSys.specialFolder.SpecialFolderEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.specialFolder.SpecialFolderEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_specialFolder.html Northcode Help Documentation
	*/
	public class SpecialFolder extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var folderID:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var folderPath:String = null;
		
		/**
		* Constructor for FileSys.SpecialFolder()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_specialFolder.html Northcode Help Documentation
		*/
		public function SpecialFolder(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param id
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_specialFolder.html Northcode Help Documentation
		*/
		public function specialFolder( id:String = null ):void
		{
			folderID = compareStrings( id , folderID );
			
			switch( folderID )
			{
				case null:
					missingFolderID();
					break;
				default:
					ssCore.FileSys.specialFolder( {folderID:folderID}
												 ,{callback:actionComplete, errorSTR:"specialFolderError", code:"9035"} );
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
			folderPath = r.result;
			
			var e : SpecialFolderEvent = new SpecialFolderEvent( SpecialFolderEvent.RESULT );
			e.folderPath = folderPath;
			dispatchEvent( e );
		}
	}
}