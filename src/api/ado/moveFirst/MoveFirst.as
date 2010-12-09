package api.ado.moveFirst
{
	import api.ado.Ado;

	import api.events.ado.moveFirst.MoveFirstEvent;

	import flash.events.IEventDispatcher;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.moveFirst.MoveFirstEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveFirst.MoveFirstEvent")]
	[Bindable]
	/**
	 * Move the current row pointer to the first row in the open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveFirst.html Northcode Help Documentation
	 */
	public class MoveFirst extends Ado
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
		 * Constructor for Ado.MoveFirst()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveFirst.html Northcode Help Documentation
		 */
		public function MoveFirst(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Move the current row pointer to the first row in the open table.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveFirst.html Northcode Help Documentation
		 */
		public function moveFirst():void
		{
			ssCore.Ado.moveFirst( {} , {callback:actionComplete, errorSTR:"moveFirstError", code:"16011"} );
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
			
			var e : MoveFirstEvent = new MoveFirstEvent( MoveFirstEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}