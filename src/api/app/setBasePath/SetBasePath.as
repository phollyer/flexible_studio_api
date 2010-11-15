package api.app.setBasePath
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;

	/**
	 * Dispatched if the Property <code>path</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_PATH
	 */
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_setBasePath.html Northcode Help Documentation
	 */
	public class SetBasePath extends App
	{
		// Required
		/**
		 * 
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
		 *
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