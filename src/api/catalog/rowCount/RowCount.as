package api.catalog.rowCount
{
	import api.catalog.Catalog;

	import api.events.catalog.rowCount.RowCountEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.catalog.rowCount.RowCountEvent.RESULT
	*/
	[Event(name="result", type="api.events.catalog.rowCount.RowCountEvent")]
	[Bindable]
	/**
	* Find out how many rows are in the catalog.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_rowCount.html Northcode Help Documentation
	*/
	public class RowCount extends Catalog
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var rowTotal:Number = 0;
		
		/**
		* Constructor for Catalog.RowCount()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_rowCount.html Northcode Help Documentation
		*/
		public function RowCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Find out how many rows are in the catalog.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_rowCount.html Northcode Help Documentation
		*/
		public function rowCount():void
		{
			ssCore.Catalog.rowCount( {}
									,{callback:actionComplete, errorSTR:"rowCountError", code:"17010"} );
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
			rowTotal = Number( r.result );
			
			var e : RowCountEvent = new RowCountEvent( RowCountEvent.RESULT );
			e.rowTotal = rowTotal;
			dispatchEvent( e );
		}
	}
}