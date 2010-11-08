package api.ado.moveBy
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveBy.MoveByEvent;

	[Event(name="missingNumber" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.ado.moveBy.MoveByEvent")]
	[Bindable]
	public class MoveBy extends Ado
	{
		// Required
		public var number:Number = -1;
		
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveBy(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function moveBy( rowCount:Number = -1 ):void
		{
			number = compareNumbers( rowCount , number );
			switch( number > 0 )
			{
				case false:
					missingNumber();
					break;
				case true:
					ssCore.Ado.moveBy( {number:number} , {callback:actionComplete, errorSTR:"moveByError", code:"16010"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveByEvent = new MoveByEvent( MoveByEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}