package api.ado.moveLast
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveLast.MoveLastEvent;

	[Event(name="result", type="api.events.ado.moveLast.MoveLastEvent")]
	[Bindable]
	public class MoveLast extends Ado
	{
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveLast(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function moveLast():void
		{
			ssCore.Ado.moveLast( {} , {callback:actionComplete, errorSTR:"moveLastError", code:"16012"} );
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveLastEvent = new MoveLastEvent( MoveLastEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}