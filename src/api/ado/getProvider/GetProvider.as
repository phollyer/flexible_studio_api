package api.ado.getProvider
{
	import flash.events.IEventDispatcher;
	
	import api.ado.Ado;
	
	import api.events.ado.getProvider.GetProviderEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.ado.GetProvider.Event.RESULT
	 */
	[Event(name="result", type="api.events.ado.getProvider.GetProviderEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getProvider.html Northcode Help Documentation
	 */
	public class GetProvider extends Ado
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var provider:String = null;
		
		/**
		 * Constructor for Ado.GetProvider()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getProvider.html Northcode Help Documentation
		 */
		public function GetProvider(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_ADO_getProvider.html Northcode Help Documentation
		 */
		public function getProvider():void
		{
			ssCore.Ado.getProvider( {} , {callback:actionComplete, errorSTR:"getProviderError", code:"16005"} );
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
			provider = r.result;
			
			var e : GetProviderEvent = new GetProviderEvent( GetProviderEvent.RESULT );
			e.provider = provider;
			dispatchEvent( e );
		}
	}
}