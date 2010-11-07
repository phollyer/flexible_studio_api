package api.ado.movePrevious
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.movePrevious.MovePreviousEvent;

	[Event(name="result", type="api.events.ado.movePrevious.MovePreviousEvent")]
	[Bindable]
	public class MovePrevious extends Ado
	{
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MovePrevious(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function movePrevious():void
		{
			ssCore.Ado.movePrevious( {} , {callback:actionComplete, errorSTR:"movePreviousError", code:"16014"} );
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MovePreviousEvent = new MovePreviousEvent( MovePreviousEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}