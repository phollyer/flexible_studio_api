package api.ado.moveBy
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveBy.MoveByEvent;

	/**
	 * Dispatched if the Property <code>number</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_NUMBER
	 */
	[Event(name="missingNumber" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.MoveBy.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveBy.MoveByEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveBy.html Northcode Help Documentation
	 */
	public class MoveBy extends Ado
	{
		// Required
		public var number:Number = -1;
		
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
		 * Constructor for Ado.MoveBy()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveBy.html Northcode Help Documentation
		 */
		public function MoveBy(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param rowCount
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveBy.html Northcode Help Documentation
		 */
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
			
			var e : MoveByEvent = new MoveByEvent( MoveByEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}