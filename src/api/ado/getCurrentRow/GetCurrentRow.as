package api.ado.getCurrentRow
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getCurrentRow.GetCurrentRowEvent;
	
	[Event(name="result", type="api.events.ado.getCurrentRow.GetCurrentRowEvent")]
	[Bindable]
	public class GetCurrentRow extends Ado
	{
		// Result
		public var row:String = null;
		
		public function GetCurrentRow(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getCurrentRow():void
		{
			ssCore.Ado.getCurrentRow( {} , {callback:actionComplete, errorSTR:"getCurrentRowError", code:"16003"} );
		}
		override protected function sendResult( r:Object ):void
		{
			row = r.result;
			
			var e : GetCurrentRowEvent = new GetCurrentRowEvent( GetCurrentRowEvent.RESULT );
			e.row = row;
			dispatchEvent( e );
		}
	}
}