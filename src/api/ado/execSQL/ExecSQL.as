package api.ado.execSQL
{
	import api.ado.Ado;

	import api.events.ado.execSQL.ExecSQLEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>sql</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_SQL
	 */
	[Event(name="missingSql" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.execSQL.ExecSQLEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.execSQL.ExecSQLEvent")]
	[Event(name="missingSQL", type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	 * Allows you to execute a SQL statement.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_execSQL.html Northcode Help Documentation
	 */
	public class ExecSQL extends Ado
	{
		// Required
		/**
		 * Any SQL statement valid for the selected provider.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var sql:String = null;
		
		// Result
		/**
		 * An ADO specific error message.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var adoError:String = null;
		
		/**
		 * Constructor for Ado.ExecSQL()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_execSQL.html Northcode Help Documentation
		 */
		public function ExecSQL(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Allows you to execute a SQL statement.
		 *
                 *
		 * @param sqlQuery
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_execSQL.html Northcode Help Documentation
		 */
		public function execSQL( sqlQuery:String = null ):void
		{
			sql = compareStrings( sqlQuery , sql );
			switch( sql )
			{
				case null:
					missingSQL();
					break;
				default:
					ssCore.Ado.execSQL( {sql:sql} , {callback:actionComplete, errorSTR:"execSQLError", code:"16001"} );
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
			var e : ExecSQLEvent = new ExecSQLEvent( ExecSQLEvent.RESULT );
			dispatchEvent( e );
		}
	}
}