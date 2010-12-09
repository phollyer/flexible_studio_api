package api.fileSys.setAttrs
{
	import api.events.fileSys.setAttrs.SetAttrsEvent;

	import api.fileSys.FileSys;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>attrs</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_ATTRS
	*/
	[Event(name="missingAttrs" , type="api.events.SWFStudioEvent")]
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Set attributes of the specified file or directory.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_setAttrs.html Northcode Help Documentation
	*/
	public class SetAttrs extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var attrs:String = null;
		/**
		* A fully qualified path to a file or directory. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.SetAttrs()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_setAttrs.html Northcode Help Documentation
		*/
		public function SetAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set attributes of the specified file or directory.
		*
		*
		* @param fileOrFolderPath
		*
		* @param attrsSTR
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_setAttrs.html Northcode Help Documentation
		*/
		public function setAttrs( fileOrFolderPath:String = null , attrsSTR:String = null ):void
		{
			path = compareStrings( fileOrFolderPath , path );
			attrs = compareStrings( attrsSTR , attrs );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( attrs )
					{
						case null:
							missingAttrs();
							break;
						default:
							setAttributes();
					}
			}
		}
		private function setAttributes():void
		{
			ssCore.FileSys.setAttrs( {path:path , attrs:attrs}
									,{callback:actionComplete, errorSTR:"setAttrsError", code:"9034"} );
		}

	}
}