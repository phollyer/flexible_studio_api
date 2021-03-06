package api.ado.find
{
	import api.ado.Ado;

	import api.events.ado.find.FindEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched if the Property <code>criteria</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_CRITERIA
	 */
	[Event(name="missingCriteria" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.find.FindEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.find.FindEvent")]
	[Bindable]
	/**
	 * Find the first or next record matching some criteria in an open table.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_find.html Northcode Help Documentation
	 */
	public class Find extends Ado
	{
		public static const FIND_FIRST:String = "FindFirst";
		public static const FIND_NEXT:String = "FindNext";
		
		// Required
		/**
		 * String that specifies the field, comparison operator and value to search for. The criteria follows the basic form of the SQL WHERE clause, but only one field is supported in the criteria and any attempt to use OR or AND will result in an error.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var criteria:String = null;
		
		// Optional
		/**
		 * 
		 *
		 * @defaultValue <code>FIND_FIRST</code>
		 */
		public var mode:String = FIND_FIRST;
		
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
		 * Constructor for Ado.Find()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_find.html Northcode Help Documentation
		 */
		public function Find(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Find the first or next record matching some criteria in an open table.
		 *
                 *
		 * @param findCriteria
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_find.html Northcode Help Documentation
		 */
		public function find( findCriteria:String = null ):void
		{
			criteria = compareStrings( findCriteria , criteria );
			switch( criteria )
			{
				case null:
					missingCriteria();
					break;
				default:
					ssCore.Ado.find( {criteria:criteria , mode:mode}
									,{callback:actionComplete, errorSTR:"findError", code:"16002"} );
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
			
			var e : FindEvent = new FindEvent( FindEvent.RESULT );
			e.adoError = adoError;
			e.row = row;
			dispatchEvent( e );
		}
	}
}