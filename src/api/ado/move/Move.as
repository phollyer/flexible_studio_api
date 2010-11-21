package api.ado.move
{
	import api.ado.Ado;

	import api.events.ado.move.MoveEvent;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>direction</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DIRECTION
	*/
	[Event(name="missingDirection" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.ado.move.MoveEvent.RESULT
	*/
	[Event(name="result", type="api.events.ado.move.MoveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_move.html Northcode Help Documentation
	*/
	public class Move extends Ado
	{				
		// Required
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var direction:String = null;
		
		// Optional
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var number:Number = 0;
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var adoError:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var row:String = null;
		
		/**
		* Constructor for Ado.Move()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_move.html Northcode Help Documentation
		*/
		public function Move(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param moveDirection
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_move.html Northcode Help Documentation
		*/
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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