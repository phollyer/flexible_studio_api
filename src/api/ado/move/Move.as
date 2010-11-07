package api.ado.move
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.move.MoveEvent;

	[Event(name="missingDirection" , type="api.events.SWFStudioEvent")]
	[Event(name="result", type="api.events.ado.move.MoveEvent")]
	[Bindable]
	public class Move extends Ado
	{				
		// Required
		public var direction:String = null;
		
		// Optional
		public var number:Number = 0;
		
		// Results
		public var adoError:String = null;
		public var row:String = null;
		
		public function Move(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function move( moveDirection:String = null ):void
		{
			direction = compareStrings( moveDirection , direction );
			switch( direction )
			{
				case null:
					missingDirection();
					break;
				default:
					ssCore.Ado.move( {direction:direction , number:number}
									,{callback:actionComplete, errorSTR:"moveError", code:"16009"} );
			}
		}
		override protected function sendResult( r:Object ):void
		{
			adoError = r.adoError;
			row = r.result;
			
			var e : MoveEvent = new MoveEvent( MoveEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}