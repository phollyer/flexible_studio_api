package api.catalog.reset
{
	import api.catalog.Catalog;

	import api.events.catalog.reset.ResetEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Call this before each new search to make sure all rows are included in the result set.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_reset.html Northcode Help Documentation
	*/
	public class Reset extends Catalog
	{
		/**
		* Constructor for Catalog.Reset()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_reset.html Northcode Help Documentation
		*/
		public function Reset(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Call this before each new search to make sure all rows are included in the result set.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_reset.html Northcode Help Documentation
		*/
		public function reset():void
		{
			ssCore.Catalog.reset( {}
								 ,{callback:actionComplete, errorSTR:"resetError", code:"17008"} );
		}
	}
}