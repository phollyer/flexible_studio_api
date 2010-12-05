package api.catalog.results
{
	import api.catalog.Catalog;

	import api.events.catalog.results.ResultsEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.catalog.results.ResultsEvent.RESULT
	*/
	[Event(name="result", type="api.events.catalog.results.ResultsEvent")]
	[Bindable]
	/**
	* Retrieve the results of a call to Catalog.Find.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_results.html Northcode Help Documentation
	*/
	public class Results extends Catalog
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
		* Constructor for Catalog.Results()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_results.html Northcode Help Documentation
		*/
		public function Results(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the results of a call to Catalog.Find.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Catalog_results.html Northcode Help Documentation
		*/
		public function results():void
		{
			var __s:String = "";
			switch( fieldList.length > 0 )
			{
				case true:
					__s = fieldList.join( "," );
			}
			ssCore.Catalog.results( {count:count , fieldList:__s , start:start}
								   ,{callback:actionComplete, errorSTR:"resultsError", code:"17009"} );
		}
		private function sendResults( r:Object ):void
		{
			rows = new Array();
			var __a:Array = r.result.split( NEW_LINE );
			for( var i : int = 0 ; i < __a.length ; i ++ )
			{
				var __b:Array = __a[ i ].split( TAB );
				rows.push( __b );
			}
			var e : ResultsEvent = new ResultsEvent( ResultsEvent.RESULT );
			e.rows = rows;
			dispatchEvent( e );
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
			var e : ResultsEvent = new ResultsEvent( ResultsEvent.RESULT );
			dispatchEvent( e );
		}
	}
}