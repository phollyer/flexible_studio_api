package api.ado.getCurrentRow
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getCurrentRow.GetCurrentRowEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetCurrentRow.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getCurrentRow.GetCurrentRowEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetCurrentRow.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getCurrentRow.GetCurrentRowEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getCurrentRow.html Northcode Help Documentation
	 */
	public class GetCurrentRow extends Ado
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var row:String = null;
		
		/**
		 * Constructor for Ado.GetCurrentRow()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getCurrentRow.html Northcode Help Documentation
		 */
		public function GetCurrentRow(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param row
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getCurrentRow.html Northcode Help Documentation
		 */
		public function getCurrentRow():void
		{
			ssCore.Ado.getCurrentRow( {} , {callback:actionComplete, errorSTR:"getCurrentRowError", code:"16003"} );
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
			row = r.result;
			
			var e : GetCurrentRowEvent = new GetCurrentRowEvent( GetCurrentRowEvent.RESULT );
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
			var e : GetCurrentRowEvent = new GetCurrentRowEvent( GetCurrentRowEvent.RESULT );
			dispatchEvent( e );
		}
	}
}