package api.catalog.rowCount
{
	import flash.events.IEventDispatcher;
	
	import api.catalog.Catalog;
	
	import api.events.catalog.rowCount.RowCountEvent;

	[Event(name="result", type="api.events.catalog.rowCount.RowCountEvent")]
	[Bindable]
	public class RowCount extends Catalog
	{
		// Result
		public var rowTotal:Number = 0;
		
		public function RowCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function rowCount():void
		{
			ssCore.Catalog.rowCount( {}
									,{callback:actionComplete, errorSTR:"rowCountError", code:"17010"} );
		}
		override protected function sendResult( r:Object ):void
		{
			rowTotal = Number( r.result );
			
			var e : RowCountEvent = new RowCountEvent( RowCountEvent.RESULT );
			e.rowTotal = rowTotal;
			dispatchEvent( e );
		}
	}
}