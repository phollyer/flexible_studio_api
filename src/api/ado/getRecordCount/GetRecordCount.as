package api.ado.getRecordCount
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getRecordCount.GetRecordCountEvent;
	
	[Event(name="result", type="api.events.ado.getRecordCount.GetRecordCountEvent")]
	[Bindable]
	public class GetRecordCount extends Ado
	{
		// Result
		public var recordCount:Number = 0 ;
		
		public function GetRecordCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getRecordCount():void
		{
			ssCore.Ado.getRecordCount( {} , {callback:actionComplete, errorSTR:"getRecordCountError", code:"16006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			recordCount = Number( r.result );
			
			var e : GetRecordCountEvent = new GetRecordCountEvent( GetRecordCountEvent.RESULT );
			e.recordCount = recordCount;
			dispatchEvent( e );
		}
	}
}