package api.catalog.find
{
	import api.catalog.Catalog;

	import api.events.catalog.find.FindEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Find the rows that match the search criteria specified using Catalog.Criteria.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_find.html Northcode Help Documentation
	*/
	public class Find extends Catalog
	{
		/**
		* Constructor for Catalog.Find()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_find.html Northcode Help Documentation
		*/
		public function Find(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Find the rows that match the search criteria specified using Catalog.Criteria.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_find.html Northcode Help Documentation
		*/
		public function find():void
		{
			ssCore.Catalog.find( {}
								,{callback:actionComplete, errorSTR:"findError", code:"17004"} );
		}
	}
}