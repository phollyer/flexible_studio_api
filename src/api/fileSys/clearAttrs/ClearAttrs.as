package api.fileSys.clearAttrs
{
	import api.events.fileSys.clearAttrs.ClearAttrsEvent;

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
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearAttrs.html Northcode Help Documentation
	*/
	public class ClearAttrs extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var attributes:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for FileSys.ClearAttrs()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearAttrs.html Northcode Help Documentation
		*/
		public function ClearAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @param fileAttrs
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_clearAttrs.html Northcode Help Documentation
		*/
		public function clearAttrs( filePath:String = null , fileAttrs:String = null ):void
		{
			path = compareStrings( filePath , path );
			attributes = compareStrings( fileAttrs , attributes );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					switch( attributes )
					{
						case null:
							missingAttrs();
							break;
						default:
							clear();
					}
			}
		}
		private function clear():void
		{
			ssCore.FileSys.clearAttrs( {attributes:attributes , path:path}
									  ,{callback:actionComplete, errorSTR:"clearAttrsError", code:"9017"} );
		}

	}
}