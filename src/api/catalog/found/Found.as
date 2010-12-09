package api.catalog.found
{
	import api.catalog.Catalog;

	import api.events.catalog.found.FoundEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.catalog.found.FoundEvent.RESULT
	*/
	[Event(name="result", type="api.events.catalog.found.FoundEvent")]
	[Bindable]
	/**
	* Find out how many rows matched the search criteria (size of the result set).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_found.html Northcode Help Documentation
	*/
	public class Found extends Catalog
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var rowNumber:Number = 0;
		
		/**
		* Constructor for Catalog.Found()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_found.html Northcode Help Documentation
		*/
		public function Found(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Find out how many rows matched the search criteria (size of the result set).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_found.html Northcode Help Documentation
		*/
		public function found():void
		{
			ssCore.Catalog.found( {}
								 ,{callback:actionComplete, errorSTR:"foundError", code:"17005"} );
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
			rowNumber = Number( r.result );
			
			var e : FoundEvent = new FoundEvent( FoundEvent.RESULT );
			e.rowNumber = rowNumber;
			dispatchEvent( e );
		}
	}
}