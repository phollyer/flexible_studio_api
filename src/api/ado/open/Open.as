package api.ado.open
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.Open.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.open.OpenEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_open.html Northcode Help Documentation
	 */
	public class Open extends Ado
	{
		// Result
		/**
		 * 
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
		 *
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