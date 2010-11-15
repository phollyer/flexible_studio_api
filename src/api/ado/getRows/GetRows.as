package api.ado.getRows
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getRows.GetRowsEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetRows.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getRows.GetRowsEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetRows.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getRows.GetRowsEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRows.html Northcode Help Documentation
	 */
	public class GetRows extends Ado
	{
		// Optional
		public var rowCount:Number = -1;
		
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var rows:String = null;
		
		/**
		 * Constructor for Ado.GetRows()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRows.html Northcode Help Documentation
		 */
		public function GetRows(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param rowCount
                 *
		 * @param rows
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRows.html Northcode Help Documentation
		 */
		public function getRows():void
		{
			ssCore.Ado.getRows( {rows:rowCount} , {callback:actionComplete, errorSTR:"getRowsError", code:"16007"} );
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
			rows = r.result;
			
			var e : GetRowsEvent = new GetRowsEvent( GetRowsEvent.RESULT );
			e.rows = rows;
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
			var e : GetRowsEvent = new GetRowsEvent( GetRowsEvent.RESULT );
			dispatchEvent( e );
		}
	}
}