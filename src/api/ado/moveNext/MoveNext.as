package api.ado.moveNext
{
	import api.ado.Ado;

	import api.events.ado.moveNext.MoveNextEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.moveNext.MoveNextEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveNext.MoveNextEvent")]
	[Bindable]
	/**
	 * Move the current row pointer to the next row in the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveNext.html Northcode Help Documentation
	 */
	public class MoveNext extends Ado
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
		 * Constructor for Ado.MoveNext()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveNext.html Northcode Help Documentation
		 */
		public function MoveNext(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Move the current row pointer to the next row in the open table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveNext.html Northcode Help Documentation
		 */
		public function moveNext():void
		{
			ssCore.Ado.moveNext( {} , {callback:actionComplete, errorSTR:"moveNextError", code:"16013"} );
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
			
			var e : MoveNextEvent = new MoveNextEvent( MoveNextEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}