package api.ado.moveTo
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveTo.MoveToEvent;

	[Event(name="missingNumber" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.ado.moveTo.MoveToEvent")]
	[Bindable]
	public class MoveTo extends Ado
	{
		// Required
		public var number:Number = -1
		
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function MoveTo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function moveTo( recordNumber:Number = -1 ):void
		{
			number = compareNumbers( recordNumber , number );
			switch( number > 0 )
			{
				case false:
					missingNumber();
					break;
				case true:
					ssCore.Ado.moveTo( {number:number} , {callback:actionComplete, errorSTR:"moveToError", code:"16015"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveToEvent = new MoveToEvent( MoveToEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}