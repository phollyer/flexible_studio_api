package api.ado.movePrevious
{
	import api.ado.Ado;

	import api.events.ado.movePrevious.MovePreviousEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.movePrevious.MovePreviousEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.movePrevious.MovePreviousEvent")]
	[Bindable]
	/**
	 * Move the current row pointer to the previous row in the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_movePrevious.html Northcode Help Documentation
	 */
	public class MovePrevious extends Ado
	{
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
		 * Constructor for Ado.MovePrevious()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_movePrevious.html Northcode Help Documentation
		 */
		public function MovePrevious(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Move the current row pointer to the previous row in the open table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_movePrevious.html Northcode Help Documentation
		 */
		public function movePrevious():void
		{
			ssCore.Ado.movePrevious( {} , {callback:actionComplete, errorSTR:"movePreviousError", code:"16014"} );
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
			
			var e : MovePreviousEvent = new MovePreviousEvent( MovePreviousEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}