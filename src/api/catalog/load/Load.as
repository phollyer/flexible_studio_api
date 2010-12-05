package api.catalog.load
{
	import api.catalog.Catalog;

	import api.events.catalog.load.LoadEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Load a catalog into memory in preparation for searching.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_load.html Northcode Help Documentation
	*/
	public class Load extends Catalog
	{
		// Required
		/**
		* A fully qualified path to the catalog table. You can provide just the catalog file name if it's an internal file in the root of the layout. This parameter supports monikers.
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		/**
		* Constructor for Catalog.Load()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_load.html Northcode Help Documentation
		*/
		public function Load(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Load a catalog into memory in preparation for searching.
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_load.html Northcode Help Documentation
		*/
		public function load( filePath:String = null ):void
		{
			path = compareStrings( filePath , path );
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Catalog.load( {path:path}
										,{callback:actionComplete, errorSTR:"loadError", code:"17006"} );
			}
		}
	}
}