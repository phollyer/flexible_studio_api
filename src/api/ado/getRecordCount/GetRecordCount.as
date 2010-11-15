package api.ado.getRecordCount
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getRecordCount.GetRecordCountEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetRecordCount.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getRecordCount.GetRecordCountEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRecordCount.html Northcode Help Documentation
	 */
	public class GetRecordCount extends Ado
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>0</code>
		 */
		public var recordCount:Number = 0 ;
		
		/**
		 * Constructor for Ado.GetRecordCount()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRecordCount.html Northcode Help Documentation
		 */
		public function GetRecordCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getRecordCount.html Northcode Help Documentation
		 */
		public function getRecordCount():void
		{
			ssCore.Ado.getRecordCount( {} , {callback:actionComplete, errorSTR:"getRecordCountError", code:"16006"} );
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
			recordCount = Number( r.result );
			
			var e : GetRecordCountEvent = new GetRecordCountEvent( GetRecordCountEvent.RESULT );
			e.recordCount = recordCount;
			dispatchEvent( e );
		}
	}
}