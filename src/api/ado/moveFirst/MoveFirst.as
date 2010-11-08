package api.ado.moveFirst
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveFirst.MoveFirstEvent;

	[Event(name="result", type="api.events.ado.moveFirst.MoveFirstEvent")]
	[Bindable]
	public class MoveFirst extends Ado
	{
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveFirst(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function moveFirst():void
		{
			ssCore.Ado.moveFirst( {} , {callback:actionComplete, errorSTR:"moveFirstError", code:"16011"} );
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveFirstEvent = new MoveFirstEvent( MoveFirstEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}