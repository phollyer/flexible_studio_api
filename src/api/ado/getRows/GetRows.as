package api.ado.getRows
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getRows.GetRowsEvent;
	
	[Event(name="result", type="api.events.ado.getRows.GetRowsEvent")]
	[Bindable]
	public class GetRows extends Ado
	{
		// Optional
		public var rowCount:Number = -1;
		
		// Result
		public var rows:String = null;
		
		public function GetRows(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getRows():void
		{
			ssCore.Ado.getRows( {rows:rowCount} , {callback:actionComplete, errorSTR:"getRowsError", code:"16007"} );
		}
		override protected function sendResult( r:Object ):void
		{
			rows = r.result;
			
			var e : GetRowsEvent = new GetRowsEvent( GetRowsEvent.RESULT );
			e.rows = rows;
			dispatchEvent( e );
		}
	}
}