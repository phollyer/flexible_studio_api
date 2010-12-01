package api.catalog.maxRows
{
	import api.catalog.Catalog;

	import api.events.catalog.maxRows.MaxRowsEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_maxRows.html Northcode Help Documentation
	*/
	public class MaxRows extends Catalog
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>100</code>
		*/
		public var number:Number = 100;
		
		/**
		* Constructor for Catalog.MaxRows()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_maxRows.html Northcode Help Documentation
		*/
		public function MaxRows(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_maxRows.html Northcode Help Documentation
		*/
		public function maxRows():void
		{
			ssCore.Catalog.maxRows( {number:number}
								   ,{callback:actionComplete, errorSTR:"maxRowsError", code:"17007"} );
		}
	}
}