package api.ado.open
{
	import api.ado.Ado;

	import api.events.ado.open.OpenEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.open.OpenEvent.RESULT
	 */
	[Event(name="result", type="api.events.ado.open.OpenEvent")]
	[Bindable]
	/**
	 * Open a table in the currently selected database.
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_open.html Northcode Help Documentation
	 */
	public class Open extends Ado
	{
		// Result
		/**
		 * An ADO specific error message.
		 *
		 * @defaultValue <code>null</code>
		 */
		public var adoError:String = null;
		
		/**
		 * Constructor for Ado.Open()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_open.html Northcode Help Documentation
		 */
		public function Open(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 * Open a table in the currently selected database.
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_open.html Northcode Help Documentation
		 */
		public function open():void
		{
			ssCore.Ado.open( {} , {callback:actionComplete, errorSTR:"openError", code:"16016"} );
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
			var e : OpenEvent = new OpenEvent( OpenEvent.RESULT );
			dispatchEvent( e );
		}
	}
}