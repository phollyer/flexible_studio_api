package api.catalog.reset
{
	import api.catalog.Catalog;

	import api.events.catalog.reset.ResetEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
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
		*
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