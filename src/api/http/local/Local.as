package api.http.local
{
	import api.events.http.local.LocalEvent;

	import api.http.Http;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Setting HTTP.local tells the plugin where to put any data that is returned from the server.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_local.html Northcode Help Documentation
	*/
	public class Local extends Http
	{
		// Required
		/**
		* Fully qualified path to a local file. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Http.Local()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_local.html Northcode Help Documentation
		*/
		public function Local(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		/**
		* Setting HTTP.local tells the plugin where to put any data that is returned from the server.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_HTTP_local.html Northcode Help Documentation
		*/
		public function local( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Http.local( {path:path}
									  ,{callback:actionComplete, errorSTR:"localError", code:"4007"} );
			}
		}
	}
}