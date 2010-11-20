package api.catalog.browse
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;
	
	import api.events.catalog.browse.BrowseEvent;

	[Event(name="result", type="api.events.catalog.browse.BrowseEvent")]
	[Bindable]
	public class Browse extends Catalog
	{
		// Optional
		public var count:Number = 1;
		public var fieldList:Array = null;
		public var start:Number = 0;
		
		// Result
		public var rows:Array = null;
		
		public function Browse(target:IEventDispatcher=null)
		{
			super(target);
		}
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