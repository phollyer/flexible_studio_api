package api.ado.moveNext
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveNext.MoveNextEvent;

	[Event(name="result", type="api.events.ado.moveNext.MoveNextEvent")]
	[Bindable]
	public class MoveNext extends Ado
	{
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveNext(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function moveNext():void
		{
			ssCore.Ado.moveNext( {} , {callback:actionComplete, errorSTR:"moveNextError", code:"16013"} );
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveNextEvent = new MoveNextEvent( MoveNextEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}