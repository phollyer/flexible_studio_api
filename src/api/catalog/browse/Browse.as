package api.catalog.browse
{
	import api.catalog.Catalog;

	import api.events.catalog.browse.BrowseEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.catalog.browse.BrowseEvent.RESULT
	*/
	[Event(name="result", type="api.events.catalog.browse.BrowseEvent")]
	[Bindable]
	/**
	* Provides random access to the raw catalog data without requiring a search to be performed.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_browse.html Northcode Help Documentation
	*/
	public class Browse extends Catalog
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>1</code>
		*/
		public var count:Number = 1;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var fieldList:Array = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var start:Number = 0;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var rows:Array = null;
		
		/**
		* Constructor for Catalog.Browse()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_browse.html Northcode Help Documentation
		*/
		public function Browse(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Provides random access to the raw catalog data without requiring a search to be performed.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_browse.html Northcode Help Documentation
		*/
		public function browse():void
		{
			var __fieldList:String = "";
			switch( fieldList.length > 0 )
			{
				case true:
					__fieldList = fieldList.join( "," );
			}
			ssCore.Catalog.browse( {count:count , fieldList:fieldList , start:start}
								  ,{callback:actionComplete, errorSTR:"browseError", code:"17002"} );
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
			var __a:Array = r.result.split( NEW_LINE );
			rows = new Array();
			for( var i : int = 0 ; i < __a.length ; i ++ )
			{
				var __b:Array = __a[ i ].split( TAB );
				rows.push( __b );
			}
			var e : BrowseEvent = new BrowseEvent( BrowseEvent.RESULT );
			e.rows = rows;
			dispatchEvent( e );
		}
	}
}