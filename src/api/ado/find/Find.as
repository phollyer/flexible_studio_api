package api.ado.find
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.find.FindEvent;
	
	/**
	 * Dispatched if the Property <code>criteria</code> has not been supplied.
	 *
	 * @eventType api.events.SWFStudioEvent.MISSING_CRITERIA
	 */
	[Event(name="missingCriteria" , type="api.events.SWFStudioEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.Find.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.find.FindEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.Find.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.find.FindEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_find.html Northcode Help Documentation
	 */
	public class Find extends Ado
	{
		public static const FIND_FIRST:String = "FindFirst";
		public static const FIND_NEXT:String = "FindNext";
		
		// Required
		/**
		 * 
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
		 * Constructor for Ado.Find()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_find.html Northcode Help Documentation
		 */
		public function Find(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param criteria
                 *
		 * @param mode
                 *
		 * @param adoError
                 *
		 * @param row
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
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			var e : FindEvent = new FindEvent( FindEvent.RESULT );
			dispatchEvent( e );
		}
	}
}