package api.ado.moveFirst
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.moveFirst.MoveFirstEvent;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.MoveFirst.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveFirst.MoveFirstEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.MoveFirst.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.moveFirst.MoveFirstEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveFirst.html Northcode Help Documentation
	 */
	public class MoveFirst extends Ado
	{
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
		 * Constructor for Ado.MoveFirst()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_moveFirst.html Northcode Help Documentation
		 */
		public function MoveFirst(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param adoError
                 *
		 * @param row
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var e : MoveFirstEvent = new MoveFirstEvent( MoveFirstEvent.RESULT );
			dispatchEvent( e );
		}
	}
}