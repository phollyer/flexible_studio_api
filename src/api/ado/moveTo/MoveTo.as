package api.ado.moveTo
{
	import api.ado.Ado;

	import api.events.ado.moveTo.MoveToEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched if the Property <code>number</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_NUMBER
	 */
	[Event(name="missingNumber" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.moveTo.MoveToEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveTo.MoveToEvent")]
	[Bindable]
	/**
	 * Move the current row pointer to the specified row in the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveTo.html Northcode Help Documentation
	 */
	public class MoveTo extends Ado
	{
		// Required
		public var number:Number = -1
		
		// Results
		/**
		 * An ADO specific error message.
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
		 * Constructor for Ado.MoveTo()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveTo.html Northcode Help Documentation
		 */
		public function MoveTo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Move the current row pointer to the specified row in the open table.
		 *
                 *
		 * @param recordNumber
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveTo.html Northcode Help Documentation
		 */
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
			
			var e : MoveToEvent = new MoveToEvent( MoveToEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}