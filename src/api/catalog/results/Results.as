package api.catalog.results
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;

	[Event(name="result", type="api.events.catalog.results.ResultsEvent")]
	[Bindable]
	public class Results extends Catalog
	{
		// Optional
		public var count:Number = 1;
		public var fieldList:Array = null;
		public var start:Number = 0;
		
		// Result
		public var rows:Array = null;
		
		public function Results(target:IEventDispatcher=null)
		{
			super(target);
		}
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
	}
}