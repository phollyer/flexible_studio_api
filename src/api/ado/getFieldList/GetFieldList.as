package api.ado.getFieldList
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getFieldList.GetFieldListEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetFieldList.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getFieldList.GetFieldListEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getFieldList.html Northcode Help Documentation
	 */
	public class GetFieldList extends Ado
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var fieldList:Array = null;
		
		/**
		 * Constructor for Ado.GetFieldList()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getFieldList.html Northcode Help Documentation
		 */
		public function GetFieldList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getFieldList.html Northcode Help Documentation
		 */
		public function getFieldList():void
		{
			ssCore.Ado.getFieldList( {} , {callback:actionComplete, errorSTR:"getFieldListError", code:"16004"} );
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
			fieldList = r.result.split( "," );
			
			var e : GetFieldListEvent = new GetFieldListEvent( GetFieldListEvent.RESULT );
			e.fieldList = fieldList;
			dispatchEvent( e );
		}
	}
}