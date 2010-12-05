package api.app.setBasePath
{
	import api.app.App;

	import api.events.app.setBasePath.SetBasePathEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched if the Property <code>path</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_PATH
	 */
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Specify the base path used to resolve relative paths in your Flash movie in commands like XML.load, loadMovie, loadMovieNum etc.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setBasePath.html Northcode Help Documentation
	 */
	public class SetBasePath extends App
	{
		// Required
		/**
		 * New base path for resolving relative paths. You can pass in a path to any existing folder to use as the application base path. If you pass an empty string, the base path will be set to the application start directory (which is the default for SWF Studio). This parameter supports monikers.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var path:String = null;
		
		/**
		 * Constructor for App.SetBasePath()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setBasePath.html Northcode Help Documentation
		 */
		public function SetBasePath(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Specify the base path used to resolve relative paths in your Flash movie in commands like XML.load, loadMovie, loadMovieNum etc.
		 *
                 *
		 * @param basePath
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setBasePath.html Northcode Help Documentation
		 */
		public function setBasePath( basePath:String = null ):void
		{
			path = compareStrings( basePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.App.setBasePath( {path:path} , {callback:actionComplete, errorSTR:"setBasePathError", code:"8015"} );
			}
		}
	}
}