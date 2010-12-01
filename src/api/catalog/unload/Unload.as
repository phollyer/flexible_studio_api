package api.catalog.unload
{
	import api.catalog.Catalog;

	import api.events.catalog.unload.UnloadEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_unload.html Northcode Help Documentation
	*/
	public class Unload extends Catalog
	{
		/**
		* Constructor for Catalog.Unload()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_unload.html Northcode Help Documentation
		*/
		public function Unload(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_unload.html Northcode Help Documentation
		*/
		public function unload():void
		{
			ssCore.Catalog.unload( {}
								  ,{callback:actionComplete, errorSTR:"unloadError", code:"17011"} );
		}
	}
}