package api.fileSys.getAttrs
{
	import api.events.fileSys.getAttrs.GetAttrsEvent;

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
	* @eventType api.events.fileSys.getAttrs.GetAttrsEvent.RESULT
	*/
	[Event(name="result", type="api.events.fileSys.getAttrs.GetAttrsEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getAttrs.html Northcode Help Documentation
	*/
	public class GetAttrs extends FileSys
	{
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var attrs:String = null;
		
		/**
		* Constructor for FileSys.GetAttrs()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getAttrs.html Northcode Help Documentation
		*/
		public function GetAttrs(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_FileSys_getAttrs.html Northcode Help Documentation
		*/
		public function getAttrs( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.FileSys.getAttrs( {path:path}
											,{callback:actionComplete, errorSTR:"getAttrsError", code:"9025"} );
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
			attrs = r.result;
			
			var e : GetAttrsEvent = new GetAttrsEvent( GetAttrsEvent.RESULT );
			e.attrs = attrs;
			dispatchEvent( e );
		}
	}
}